import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/home/presentation/widgets/navigation_tab.dart';
import 'package:flutter/material.dart';

class NavigationTabsSection extends StatelessWidget {
  const NavigationTabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsive.paddingSymmetric(horizontal: 24),
      child: Container(
        padding: AppResponsive.paddingXSmall,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppResponsive.radiusLarge),
          // ignore: deprecated_member_use
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            NavigationTab(text: 'Explorar', isActive: true),
            NavigationTab(text: 'Recientes', isActive: false),
            NavigationTab(text: 'Logros', isActive: false),
          ],
        ),
      ),
    );
  }
}
