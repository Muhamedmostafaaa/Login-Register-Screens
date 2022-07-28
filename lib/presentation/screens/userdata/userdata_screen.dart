import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/presentation/screens/login/login_screen.dart';
import 'package:magdsoft_task/presentation/shared_widgets/button.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDataScreen extends StatelessWidget{
  static const String ROUTENAME='Userdatascreen';
  String? name;
  String? email;
  String? phone;
  UserDataScreen({ this.name='', this.phone='', this.email=''});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
     Column(crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Container(
           height: 67.h,color: AppColors.blue,
           child: Center(child: Text(AppLocalizations.of(context)!.userdata,textAlign: TextAlign.center,
           style: TextStyle(fontSize: 30.sp,color:AppColors.white),)),
         ),
         SizedBox(height: 157.h,),
         Column(
           children: [
             Text('${AppLocalizations.of(context)!.name} :$name',style: TextStyle(fontSize: 25.sp,color: AppColors.blue),),
             SizedBox(height: 8.h,),
             Text('${AppLocalizations.of(context)!.email} :$email ',style: TextStyle(fontSize: 25.sp,color: AppColors.blue),),
             SizedBox(height: 8.h,),
             Text('${AppLocalizations.of(context)!.phone} :$phone ',style: TextStyle(fontSize: 25.sp,color: AppColors.blue),),
             SizedBox(height: 400.h,),
             Button(text: AppLocalizations.of(context)!.logout, onclick: (){
               Navigator.pushNamed(context, LoginScreen.ROUTE_NAME);
             },color: AppColors.userbuttoncolor,)
           ],
         ),

       ],
     ),
    );
  }

}