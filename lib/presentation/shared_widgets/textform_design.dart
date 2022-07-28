import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class TextFormDesign extends StatelessWidget {
  Widget? suffix;
  String hinttext;
  String? Function(String?)? validate;
  TextInputType type;
  TextEditingController controller;
  bool ishidden;
  TextFormDesign(
      {required this.controller,
      required this.type,
      this.suffix,
      required this.hinttext,
      this.validate,this.ishidden=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      child: TextFormField(
        obscureText:ishidden ,
        controller: controller,
        keyboardType: type,
        validator: validate,
        decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 0.01.sp),
            hintText: hinttext,
            hintStyle: TextStyle(color: AppColors.textcolor, fontSize: 17.sp),
            suffixIcon: suffix,
            filled: true,
            fillColor: AppColors.fillcolor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.bordercolor)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.bordercolor),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: AppColors.bordercolor,
                ),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
