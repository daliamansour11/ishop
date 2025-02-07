


import 'package:flutter/material.dart';
import 'package:ishop/core/resources/colors_manger.dart';

import '../../core/resources/font_manger.dart';

ThemeData appTheme() {
  return ThemeData(

  colorScheme: ColorScheme.fromSeed(seedColor: ColorsManger.lightPrimary)
  ,
  scaffoldBackgroundColor: ColorsManger.white,



    fontFamily: "Rubik",
      // primaryColor: ColorsManger.lightPrimary,
      // splashColor: ColorsManger.white,
      textTheme: textTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManger.cMainColor1.withOpacity(0.9),
        splashColor: ColorsManger.lightPrimary,
      ),
      // colorScheme:
      // // ColorScheme.fromSwatch().copyWith(primary: ColorsManger.white),
  appBarTheme: appBarTheme(),
  );

}
//deep linking
AppBarTheme appBarTheme(){
  return const AppBarTheme(
      // color: ColorsManger.white
      // ,
    backgroundColor: ColorsManger.lightPrimary,
      foregroundColor: ColorsManger.semiGreen,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsManger.cMainColor1),
      titleTextStyle: TextStyle(color: ColorsManger.dark,fontSize: FontSize.s28)

  );

}

TextTheme  textTheme(){
  return const TextTheme(
    bodySmall: TextStyle(color: ColorsManger.dark,fontSize: 16,fontWeight: FontWeight.w400),
    titleSmall: TextStyle(color: ColorsManger.dark,fontSize: 18,fontWeight: FontWeight.w500),
    titleMedium: TextStyle(color: ColorsManger.darkPrimary,fontSize: 22,fontWeight: FontWeight.w700,),
    bodyLarge: TextStyle(color: ColorsManger.cMainColor1,fontSize: 25,fontWeight: FontWeight.w700),
    labelLarge: TextStyle(color: ColorsManger.dark,fontSize: 23,fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(color: ColorsManger.cMainColor1,fontSize: 26,fontWeight: FontWeight.w700),

  );
}
