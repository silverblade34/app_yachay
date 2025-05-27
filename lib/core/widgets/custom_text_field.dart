import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool? isObscure;
  final VoidCallback? onToggleVisibility;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.isObscure,
    this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDarkIntense,
        borderRadius: BorderRadius.circular(16.r),
        // ignore: deprecated_member_use
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        obscureText: isPassword ? (isObscure ?? true) : false,
        keyboardType:
            isPassword ? TextInputType.text : TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          // ignore: deprecated_member_use
          hintStyle:
              // ignore: deprecated_member_use
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14.sp),
          prefixIcon: Icon(icon, color: AppColors.primary, size: 22.sp),
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: onToggleVisibility,
                  child: Icon(
                    (isObscure ?? true)
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.5),
                    size: 22.sp,
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.w),
        ),
      ),
    );
  }
}
