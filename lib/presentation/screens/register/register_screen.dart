import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/presentation/screens/login/login_screen.dart';

import '../../shared_widgets/button.dart';
import '../../shared_widgets/textform_design.dart';
import '../../styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget{
  static const ROUTE_NAME='registerscreen';
  final formkey=GlobalKey<FormState>();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController fullnamecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController confirmpasswordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       resizeToAvoidBottomInset: false,
       backgroundColor: AppColors.blue,
       body: Column(
         children: [
           Stack(
             children: [
               SizedBox(
                 height: 241.h,
               ),
               Container(
                   margin:
                   EdgeInsets.only(left: 123.w, right: 122.w, top: 13.h),
                   height: 227.h,
                   child: Image.asset('assets/images/logo.png')),

             ],
           ),
           Container(
             height: 629.h,
             decoration: BoxDecoration(
                 color: AppColors.white,
                 borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(45),
                     topRight: Radius.circular(45))),
             child: Column(
               children: [
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 63.w),
                   child: Form(
                     key: formkey,
                     child: Column(
                       children: [
                         SizedBox(
                           height: 70.h,
                         ),
                         TextFormDesign(
                           hinttext: AppLocalizations.of(context)!.fullname,
                           controller: fullnamecontroller,
                           type: TextInputType.text,
                           validate: (value) {
                             if (value!.isEmpty) {
                               return 'Please Enter Full Name';
                             }
                           },
                         ),
                         SizedBox(
                           height: 18.h,
                         ),
                         TextFormDesign(
                           hinttext: AppLocalizations.of(context)!.email,

                           controller: emailcontroller,
                           type: TextInputType.text,
                           validate: (value) {
                             if (value!.isEmpty) {
                               return 'Please Enter Email';
                             }
                           },
                         ),
                         SizedBox(
                           height: 18.h,
                         ),
                         TextFormDesign(
                           hinttext: AppLocalizations.of(context)!.phone,

                           controller: phonecontroller,
                           type: TextInputType.number,
                           validate: (value) {
                             if (value!.isEmpty) {
                               return 'Please Enter Phone';
                             }
                           },
                         ),
                         SizedBox(
                           height: 18.h,
                         ),
                         TextFormDesign(
                           hinttext: AppLocalizations.of(context)!.password,
                           suffix: Icon(Icons.visibility_off),
                           controller: passwordcontroller,
                           type: TextInputType.number,
                           ishidden: true,
                           validate: (value) {
                             if (value!.isEmpty) {
                               return 'Please Enter Password';
                             }
                           },
                         ),
                         SizedBox(
                           height: 18.h,
                         ),
                         TextFormDesign(
                           hinttext: AppLocalizations.of(context)!.confirmpassword,
                           suffix: Icon(Icons.visibility_off),
                           controller: confirmpasswordcontroller,
                           ishidden: true,
                           type: TextInputType.number,
                           validate: (value) {
                             if (value!.isEmpty) {
                               return 'Please Enter Password';
                             }
                           },
                         ),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 106.h,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Button(text:AppLocalizations.of(context)!.register, onclick: () {
                       if (formkey.currentState!.validate()) {}
                     }),
                     Button(
                         text: AppLocalizations.of(context)!.login,
                         onclick: () {
                           Navigator.pushNamed(context, LoginScreen.ROUTE_NAME);
                         })
                   ],
                 )
               ],
             ),
           ),
         ],
       ));
  }

}