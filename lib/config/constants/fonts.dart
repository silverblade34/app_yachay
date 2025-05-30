import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle titleIntro = TextStyle(
    color: HexColor('#E5E3FC'),
    fontSize: AppResponsive.fontSizeHeading,
    fontWeight: FontWeight.bold,
  );

  static TextStyle descriptionIntro({bool isLight = false}) => TextStyle(
    fontSize: AppResponsive.fontSizeRegular,
    color: isLight ? HexColor('#857FB4') : HexColor('#E5E3FC'),
  );

  static TextStyle titleLogin = TextStyle(
    color: Colors.white,
    fontSize: AppResponsive.fontSizeTitle,
    fontWeight: FontWeight.bold,
  );

  static TextStyle descriptionLogin = TextStyle(
    color: Colors.white70,
    fontSize: AppResponsive.fontSizeMedium,
  );

  // Nuevos estilos usando AppResponsive
  static TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: AppResponsive.fontSizeRegular,
    fontWeight: FontWeight.w600,
  );

  static TextStyle checkboxText = TextStyle(
    color: Colors.white70,
    fontSize: AppResponsive.fontSizeSmall,
  );

  static TextStyle linkText = TextStyle(
    color: HexColor('#6C5CE7'),
    fontSize: AppResponsive.fontSizeSmall,
    fontWeight: FontWeight.w500,
  );

  static TextStyle hintText = TextStyle(
    color: Colors.white60,
    fontSize: AppResponsive.fontSizeRegular,
  );

  static TextStyle inputText = TextStyle(
    color: Colors.white,
    fontSize: AppResponsive.fontSizeRegular,
  );

  static TextStyle heading1 = AppResponsive.textStyle(
    fontSize: AppResponsive.fontSizeHeading,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading2 = AppResponsive.textStyle(
    fontSize: AppResponsive.fontSizeTitle,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading3 = AppResponsive.textStyle(
    fontSize: AppResponsive.fontSizeXLarge,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyLarge = AppResponsive.textStyle(
    fontSize: AppResponsive.fontSizeLarge,
  );

  static TextStyle bodyMedium = AppResponsive.textStyle(
    fontSize: AppResponsive.fontSizeRegular,
  );

  static TextStyle bodySmall = AppResponsive.textStyle(
    fontSize: AppResponsive.fontSizeSmall,
  );

  static TextStyle caption = AppResponsive.textStyle(
    fontSize: AppResponsive.fontSizeXSmall,
  );
}