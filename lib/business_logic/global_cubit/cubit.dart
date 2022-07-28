import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_task/business_logic/global_cubit/states.dart';
import 'package:magdsoft_task/constants/end_points.dart';
import 'package:magdsoft_task/data/local/cache_helper.dart';
import 'package:magdsoft_task/data/models/Login_model.dart';

import 'package:magdsoft_task/data/remote/dio_helper.dart';
import 'package:magdsoft_task/presentation/screens/userdata/userdata_screen.dart';
import 'package:magdsoft_task/presentation/shared_widgets/toast.dart';

import '../../presentation/styles/colors.dart';

class Appcubit extends Cubit<AppStates>{
  Appcubit(): super(AppInitialState());
 late LoginModel loginmodel;
 String local= CacheHelper.getdata('local')??'en';
 void changelang(){
   if(local=='en'){
     local='ar';
     CacheHelper.putdata('local', 'ar');
   }else{
     local='en';
     CacheHelper.putdata('local', 'en');
   }
   emit(AppLcoalState());
 }

  void userlogin({required String email,required String password,required BuildContext context}){
    emit(AppLoginLoadingState());
    DioHelper.postdata(url:LOGIN, data:{
      'email':email ,
      'password':password
    }).then((value){

      loginmodel=LoginModel.fromJson(value.data);

      if(loginmodel.status==200){
      showtoast('login successfully');
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return UserDataScreen(name:loginmodel.account?[0].name,email: loginmodel.account?[0].email,phone: loginmodel.account?[0].phone,);
      }));
      emit(AppLoginSuccessState());}else{
        showtoast('Error in Login');
        emit(AppLoginErrorState('error in loading'));}
    }).catchError((error){
      print('the error is $error');
      emit(AppLoginErrorState(error));
    });
  }

}