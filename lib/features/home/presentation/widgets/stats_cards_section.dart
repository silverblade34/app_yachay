import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/home/presentation/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class StatsCardsSection extends StatelessWidget {
  const StatsCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsive.paddingSymmetric(horizontal: 24, vertical: 15),
      child: Row(
        children: [
          StatCard(
            icon: Icons.trending_up,
            iconColor: Colors.green,
            value: '85%',
            label: 'Promedio',
            trend: '+12%',
          ),
          AppResponsive.horizontalSpace12,
          StatCard(
            icon: Icons.flash_on,
            iconColor: AppColors.accent,
            value: '23',
            label: 'Pruebas',
            trend: '🔥7',
          ),
          AppResponsive.horizontalSpace12,
          StatCard(
            icon: Icons.access_time,
            iconColor: Colors.blue,
            value: '2.4h',
            label: 'Esta semana',
            trend: '↗',
          ),
        ],
      ),
    );
  }
}