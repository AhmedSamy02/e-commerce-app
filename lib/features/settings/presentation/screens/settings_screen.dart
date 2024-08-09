import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/profile/presentation/controllers/profile_cubit.dart';
import 'package:simple_ecommerce/features/profile/presentation/controllers/profile_state.dart';
import 'package:simple_ecommerce/features/settings/presentation/widgets/logout_button.dart';
import 'package:simple_ecommerce/features/settings/presentation/widgets/setting_account_data.dart';
import 'package:simple_ecommerce/core/constants/widgets/list_tile_row.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(18.sp),
        child: Column(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, kEditProfileScreen);
                  },
                  child: SettingsAccountData(
                    firstName:
                        BlocProvider.of<ProfileCubit>(context).oldFirstName,
                    lastName:
                        BlocProvider.of<ProfileCubit>(context).oldLastName,
                    email: BlocProvider.of<ProfileCubit>(context)
                        .emailController
                        .text,
                  ),
                );
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            ListTileRow(
              icon: kMyDetailsIconAsset,
              title: 'My Details',
              iconHeight: 14.h,
              iconWidth: 14.h,
              onTap: () {
                Navigator.pushNamed(context, kEditProfileScreen);
              },
            ),
            const Divider(),
            SizedBox(
              height: 6.h,
            ),
            ListTileRow(
              icon: kOrderIconAsset,
              title: 'Orders',
              iconHeight: 18.h,
              iconWidth: 18.h,
              onTap: () {
                Navigator.pushNamed(context, kOrderHistoryScreen);
              },
            ),
            const Divider(),
            const Spacer(),
            LogoutButton(
              onPressed: () async {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: 'Do you want to logout',
                  confirmBtnText: 'Yes',
                  cancelBtnText: 'No',
                  confirmBtnColor: Colors.green,
                  onConfirmBtnTap: () async {
                    final secure = getit.get<FlutterSecureStorage>();
                    secure.deleteAll().then(
                      (value) {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushReplacementNamed(kLandingScreen);
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
