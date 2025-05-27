import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/themes/theme.dart';
import 'package:app_yachay/core/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class IntroIndicators extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final List<int> activeIndex;

  const IntroIndicators({
    super.key,
    this.onBack,
    this.onNext,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = List.generate(3, (i) {
      bool isActive = i == activeIndex[0];
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
        onBack != null
            ? MyIcon1(
                bg: AppTheme.isLightTheme
                    ? HexColor('#FFE5E5')
                    : AppColors.secondaryDark,
                click: onBack!,
                icon: Ionicons.chevron_back,
                icolor: AppColors.secondaryLight,
              )
            : SizedBox(width: 60.w),
        Row(children: indicators),
        MyIcon(click: onNext!),
      ],
    );
  }
}
