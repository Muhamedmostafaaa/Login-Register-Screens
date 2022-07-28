import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/global_cubit/cubit.dart';
import 'package:magdsoft_task/business_logic/global_cubit/states.dart';
import 'package:magdsoft_task/presentation/screens/register/register_screen.dart';
import 'package:magdsoft_task/presentation/shared_widgets/button.dart';
import 'package:magdsoft_task/presentation/shared_widgets/textform_design.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreen extends StatelessWidget {
  static const ROUTE_NAME = 'login screen';
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<Appcubit>(context);
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blue,
            body: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 247.h,
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 123.w, right: 122.w, top: 20.h),
                        height: 227.h,
                        child: Image.asset('assets/images/logo.png')),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(top: 47.h, right: 21.w),
                        width: 84.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(onTap: (){
                          cubit.changelang();
                        },
                          child: Center(
                            child: Text(
                              cubit.local=='en'?'عربي':'English',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 623.h,
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
                                height: 167.h,
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
                                hinttext: AppLocalizations.of(context)!.password,
                                suffix: Icon(Icons.visibility_off),
                                controller: passwordcontroller,
                                type: TextInputType.number,ishidden: true,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 175.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button(
                              text: AppLocalizations.of(context)!.register,
                              onclick: () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.ROUTE_NAME);
                              }),
                          ConditionalBuilder(
                            condition: state is! AppLoginLoadingState,
                            builder: (context) => Button(
                                text: AppLocalizations.of(context)!.login,
                                onclick: () {
                                  if (formkey.currentState!.validate()) {
                                   cubit.userlogin(email: emailcontroller.text, password: passwordcontroller.text,context:context);

                                  }
                                }),
                            fallback: (context) => CircularProgressIndicator(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
