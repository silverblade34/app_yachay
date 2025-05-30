import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
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
          child: DropdownButtonFormField<String>(
            onChanged: onChanged,
            dropdownColor: AppColors.backgroundDarkIntense,
            style: AppResponsive.textStyle(
              color: AppColors.textDark,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: AppResponsive.paddingXRegular,
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
