import 'package:app_yachay/config/constants/fonts.dart';
import 'package:app_yachay/config/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroContent extends StatelessWidget {
  final String title;
  final String description;

  const IntroContent({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, textAlign: TextAlign.center, style: AppFonts.titleIntro),
        SizedBox(height: 15.h),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppFonts.descriptionIntro(isLight: AppTheme.isLightTheme),
        ),
      ],
    );
  }
}
