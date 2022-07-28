import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';

class Button extends StatelessWidget {
  String text;
  VoidCallback onclick;
  Color? color;
  Button({required this.text, required this.onclick,this.color=AppColors.blue});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 61.h,
        width: 152.w,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                primary: color),
            onPressed: onclick,
            child: Text(
              text,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400,color: AppColors.white),
            )));
  }
}
