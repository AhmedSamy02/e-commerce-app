import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListTileRow extends StatelessWidget {
  const ListTileRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.iconWidth,
      required this.iconHeight,
      required this.onTap});
  final String icon;
  final double iconWidth;
  final double iconHeight;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(
        icon,
        width: iconWidth,
        height: iconHeight,
      ),
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(
        title,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 18.sp,
      ),
    );
  }
}
