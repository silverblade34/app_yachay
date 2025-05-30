import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:flutter/material.dart';

class ProfileSetupProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProfileSetupProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final bool isActive = index <= currentStep;
        final bool isCurrent = index == currentStep;
        
        return Row(
          children: [
            _buildStepIndicator(
              isActive: isActive,
              isCurrent: isCurrent,
            ),
            if (index < totalSteps - 1)
              _buildStepConnector(isActive: isActive),
          ],
        );
      }),
    );
  }

  Widget _buildStepIndicator({
    required bool isActive,
    required bool isCurrent,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: AppResponsive.width(isCurrent ? 12 : 8),
      height: AppResponsive.height(isCurrent ? 12 : 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primary : AppColors.textDarkSubtitle,
        boxShadow: isCurrent
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
    );
  }

  Widget _buildStepConnector({required bool isActive}) {
    return Container(
      width: AppResponsive.width(40),
      height: AppResponsive.height(2),
      margin: AppResponsive.paddingSymmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.textDarkSubtitle,
        borderRadius: AppResponsive.borderRadiusSmall,
      ),
    );
  }
}