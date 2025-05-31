import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/home/controllers/home_controller.dart';
import 'package:app_yachay/features/home/presentation/widgets/categories_section.dart';
import 'package:app_yachay/features/home/presentation/widgets/custom_bottom_navigation.dart';
import 'package:app_yachay/features/home/presentation/widgets/home_header.dart';
import 'package:app_yachay/features/home/presentation/widgets/home_search_bar.dart';
import 'package:app_yachay/features/home/presentation/widgets/navigation_tabs_section.dart';
import 'package:app_yachay/features/home/presentation/widgets/quick_actions_section.dart';
import 'package:app_yachay/features/home/presentation/widgets/stats_cards_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppResponsive.height(70),
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    // ignore: deprecated_member_use
                    AppColors.primary.withOpacity(0.2),
                    // ignore: deprecated_member_use
                    AppColors.primaryDark.withOpacity(0.2),
                  ],
                ),
              ),
              child: FlexibleSpaceBar(
                background: const HomeHeader(),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeSearchBar(),
                const QuickActionsSection(),
                const StatsCardsSection(),
                const NavigationTabsSection(),
                const CategoriesSection(),
                AppResponsive.verticalSpace(20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
