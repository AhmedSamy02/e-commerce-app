import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
    required this.date,
    required this.text,
  });

  final DateTime date;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$text : ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: Colors.grey[600],
          ),
        ),
        Icon(
          Icons.calendar_today,
          size: 20.sp,
          color: kMainGreen,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.sp),
          child: Text(
            '${date.day}/${date.month}/${date.year}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
        ),
        const Spacer(),
        Icon(
          Icons.access_time,
          size: 20.sp,
          color: kMainGreen,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.sp),
          child: Text(
            '${date.hour~/10}${date.hour%10}:${date.minute~/10}${date.minute%10}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
        ),
      ],
    );
  }
}
