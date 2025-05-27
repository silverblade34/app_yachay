import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  static TextStyle titleIntro = TextStyle(
    color: HexColor('#E5E3FC'),
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle descriptionIntro({bool isLight = false}) => TextStyle(
        fontSize: 14.sp,
        color: isLight ? HexColor('#857FB4') : HexColor('#E5E3FC'),
      );
}
