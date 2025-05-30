import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final String hint;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerField({
    super.key,
    required this.label,
    required this.hint,
    required this.selectedDate,
    required this.onDateSelected,
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
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: selectedDate ??
                  DateTime.now().subtract(const Duration(days: 6570)),
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.dark(
                      primary: AppColors.primary,
                      surface: AppColors.backgroundDarkIntense,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (date != null) {
              onDateSelected(date);
            }
          },
          child: Container(
            padding: AppResponsive.paddingXRegular,
            decoration: BoxDecoration(
              color: AppColors.backgroundDarkIntense,
              borderRadius: AppResponsive.borderRadiusRegular,
              border: Border.all(
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : hint,
                  style: AppResponsive.textStyle(
                    color: selectedDate != null
                        ? AppColors.textDark
                        : AppColors.textDarkSubtitle,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  color: AppColors.primary,
                  size: AppResponsive.iconSizeMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
