import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putdata(@required String key, @required dynamic value) async {
    return await sharedPreferences.setString(key, value);
  }
  static String? getdata(@required String key){
     return sharedPreferences.getString(key);
  }
}
