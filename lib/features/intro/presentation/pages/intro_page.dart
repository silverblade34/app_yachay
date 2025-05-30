import 'package:app_yachay/features/intro/controllers/intro_controller.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_content.dart';
import 'package:app_yachay/features/intro/presentation/widgets/intro_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              const Color.fromARGB(255, 18, 77, 73),
              const Color.fromARGB(255, 43, 118, 113),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              SizedBox(height: AppBar().preferredSize.height),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.introData.length,
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    final data = controller.introData[index];
                    return Column(
                      children: [
                        Image.asset(data['imagePath'],
                            height: 0.25.sh, width: 1.sw),
                        SizedBox(height: 30.h),
                        IntroContent(
                          title: data['title'],
                          description: data['description'],
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              // Indicadores y botones de navegación
              Obx(() => IntroIndicators(
                currentPageIndex: controller.currentPage.value,
                totalIndicators: controller.introData.length,
                onPreviousPressed: controller.canGoPrevious() 
                    ? controller.goToPreviousPage 
                    : null,
                onNextPressed: controller.canGoNext() 
                    ? controller.goToNextPage 
                    : null,
                onLoginPressed: controller.isLastPage() 
                    ? controller.goToLogin 
                    : null,
              )),
            ],
          ),
        ),
      ),
    );
  }
}