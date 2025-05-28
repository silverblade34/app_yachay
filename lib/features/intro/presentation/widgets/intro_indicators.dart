import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroIndicators extends StatelessWidget {
  final int currentPageIndex;
  final int totalIndicators;

  const IntroIndicators({
    super.key,
    required this.currentPageIndex,
    required this.totalIndicators,
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> indicators = List.generate(totalIndicators, (i) {
      bool isActive = i == currentPageIndex;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.r),
        height: 10.h,
        width: isActive ? 30.w : 15.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          color: isActive ? AppColors.secondary : HexColor('#E8E5FF'),
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Row(children: indicators),
        SizedBox(),
      ],
    );
  }
}
