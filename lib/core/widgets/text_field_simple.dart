import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class TextFieldSimple extends StatelessWidget {
  final String label;
  final String hint;
  final Function(String) onChanged;

  const TextFieldSimple({
    super.key,
    required this.label,
    required this.hint,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppResponsive.textStyle(
            fontSize: AppResponsive.fontSizeRegular,
            fontWeight: FontWeight.w600,
            color: AppColors.textDarkTitle,
          ),
        ),
        AppResponsive.verticalSpace8,
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundDarkIntense,
            borderRadius: AppResponsive.borderRadiusRegular,
            border: Border.all(
              // ignore: deprecated_member_use
              color: AppColors.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextField(
            onChanged: onChanged,
            style: AppResponsive.textStyle(
              fontSize: AppResponsive.fontSizeSmall,
              color: AppColors.textDark,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppResponsive.textStyle(
                fontSize: AppResponsive.fontSizeSmall,
                color: AppColors.textDarkSubtitle,
              ),
              border: InputBorder.none,
              contentPadding: AppResponsive.paddingXRegular,
            ),
          ),
        ),
      ],
    );
  }
}
