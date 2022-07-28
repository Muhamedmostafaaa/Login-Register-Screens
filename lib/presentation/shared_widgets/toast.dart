import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';

void showtoast(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor:AppColors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}