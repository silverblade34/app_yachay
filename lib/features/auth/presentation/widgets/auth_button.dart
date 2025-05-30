import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final RxBool isLoading;
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const AuthButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
    this.fontSize = 14,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: isLoading.value ? null : onPressed,
          child: Container(
            width: double.infinity,
            padding: padding is EdgeInsets
                ? (padding as EdgeInsets).copyWith(
                      top: (padding as EdgeInsets).top.h,
                      bottom: (padding as EdgeInsets).bottom.h,
                    )
                : padding,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isLoading.value
                    ? [Colors.grey.shade600, Colors.grey.shade700]
                    : [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: isLoading.value
                ? Center(
                    child: SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ));
  }
}
