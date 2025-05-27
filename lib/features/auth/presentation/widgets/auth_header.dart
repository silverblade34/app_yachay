import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.w),
      child: Column(
        children: [
          Container(
            width: 120.w,
            height: 120.w,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  ConstanceData.yachayMonocramatico,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            '¡Hola de nuevo!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Inicia sesión para continuar aprendiendo',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
