import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/home/presentation/widgets/reward_button.dart';
import 'package:app_yachay/features/home/presentation/widgets/reward_chip.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsive.paddingOnly(
        left: 15,
        top: 60,
        right: 15,
        bottom: 20,
      ),
      child: Row(
        children: [
          // Avatar y saludo
          Expanded(
            child: Row(
              children: [
                _buildAvatar(),
                AppResponsive.horizontalSpace12,
                Expanded(
                  child: _buildWelcomeText(),
                ),
              ],
            ),
          ),

          // Puntos y trofeo
          _buildRewardsSection(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: AppResponsive.width(50),
      height: AppResponsive.height(50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(AppResponsive.radius(25)),
      ),
      child: Image.asset(ConstanceData.avatarCondorSabio),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¡Hola, Marcos!',
          style: AppResponsive.textStyle(
            fontSize: AppResponsive.fontSizeRegular,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        Text(
          'Listo para aprender algo nuevo',
          style: AppResponsive.textStyle(
            fontSize: AppResponsive.fontSizeXSmall,
            color: AppColors.textDarkSubtitle,
          ),
        ),
      ],
    );
  }

  Widget _buildRewardsSection() {
    return Row(
      children: [
        RewardChip(
          icon: Icons.star,
          value: '1,247',
          color: AppColors.accent,
        ),
        AppResponsive.horizontalSpace4,
        RewardButton(
          icon: Icons.emoji_events,
          onTap: () {
            // Navegar a logros
          },
        ),
      ],
    );
  }
}