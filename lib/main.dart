
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/global_cubit/cubit.dart';
import 'package:magdsoft_task/business_logic/global_cubit/states.dart';
import 'package:magdsoft_task/data/local/cache_helper.dart';
import 'package:magdsoft_task/data/remote/dio_helper.dart';
import 'package:magdsoft_task/presentation/screens/login/login_screen.dart';
import 'package:magdsoft_task/presentation/screens/register/register_screen.dart';
import 'package:magdsoft_task/presentation/screens/userdata/userdata_screen.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'business_logic/bloc_observer.dart';

void main(){
  BlocOverrides.runZoned(
        ()async {
          WidgetsFlutterBinding.ensureInitialized();
          DioHelper.init();
          await CacheHelper.init();
      runApp(myapp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return
     ScreenUtilInit(
       designSize:const Size(412,870) ,
       minTextAdapt: true,
     builder: (context,child){
         return BlocProvider<Appcubit>(create: (context)=>Appcubit(),
           child: BlocConsumer<Appcubit,AppStates>(listener: (context,state){},
             builder: (context,state){
             var cubit=BlocProvider.of<Appcubit>(context);
             return MaterialApp(
               localizationsDelegates: [
                 AppLocalizations.delegate,
                 GlobalMaterialLocalizations.delegate,
                 GlobalWidgetsLocalizations.delegate,
                 GlobalCupertinoLocalizations.delegate,
               ],
               supportedLocales: AppLocalizations.supportedLocales,
               locale: Locale(cubit.local,''),
               debugShowCheckedModeBanner: false,
               theme: ThemeData(
                 fontFamily: 'cairo',
                 scaffoldBackgroundColor: AppColors.white,
                 appBarTheme: AppBarTheme(
                   elevation: 0.0,
                   systemOverlayStyle: SystemUiOverlayStyle(
                     statusBarColor: Colors.transparent,
                     statusBarIconBrightness: Brightness.dark,
                   ),
                 ),),
               routes: {
                 LoginScreen.ROUTE_NAME:(context)=> LoginScreen(),
                 RegisterScreen.ROUTE_NAME:(context)=> RegisterScreen(),
                 UserDataScreen.ROUTENAME: (context)=>UserDataScreen()

               },
               initialRoute: LoginScreen.ROUTE_NAME,
             );
             },


           ),
         );
     },

   );
  }

}