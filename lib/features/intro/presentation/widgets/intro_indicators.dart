import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroIndicators extends StatelessWidget {
  final int currentPageIndex;
  final int totalIndicators;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onLoginPressed;

  const IntroIndicators({
    super.key,
    required this.currentPageIndex,
    required this.totalIndicators,
    this.onPreviousPressed,
    this.onNextPressed,
    this.onLoginPressed,
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
        // Botón Previous con flecha
        Container(
          width: 50.w,
          height: 50.h,
          child: onPreviousPressed != null
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPreviousPressed,
                    borderRadius: BorderRadius.circular(25.r),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),

        // Indicadores
        Row(children: indicators),

        // Botón Next/Login con flecha
        Container(
          width: 50.w,
          height: 50.h,
          child: onLoginPressed != null
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onLoginPressed,
                    borderRadius: BorderRadius.circular(25.r),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.secondary,
                            AppColors.secondary.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.secondary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                )
              : onNextPressed != null
                  ? Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onNextPressed,
                        borderRadius: BorderRadius.circular(25.r),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
        ),
      ],
    );
  }
}