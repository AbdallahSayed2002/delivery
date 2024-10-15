import 'package:flutter/material.dart';
import 'colors.dart';

// Light Theme for English
ThemeData themeEnglishLight = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'PlayfairDisplay',
  colorScheme: ColorScheme.light(
    primary: AppColor.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColor.secondaryColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
    bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black54),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    titleTextStyle: const TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Dark Theme for English
ThemeData themeEnglishDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'PlayfairDisplay',
  colorScheme: ColorScheme.dark(
    primary: AppColor.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColor.secondaryColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
    bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white70),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    titleTextStyle: const TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Light Theme for Arabic
ThemeData themeArabicLight = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Cairo',
  colorScheme: ColorScheme.light(
    primary: AppColor.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColor.secondaryColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
    bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black54),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    titleTextStyle: const TextStyle(
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Dark Theme for Arabic
ThemeData themeArabicDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Cairo',
  colorScheme: ColorScheme.dark(
    primary: AppColor.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColor.secondaryColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
    bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white70),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    titleTextStyle: const TextStyle(
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
