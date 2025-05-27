import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroLayout extends StatelessWidget {
  final String imagePath;
  final Widget content;
  final Widget indicators;

  const IntroLayout({
    super.key,
    required this.imagePath,
    required this.content,
    required this.indicators,
  });

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
              Image.asset(imagePath, height: 0.25.sh, width: 1.sw),
              SizedBox(height: 30.h),
              Expanded(child: content),
              Padding(padding: EdgeInsets.all(20.w), child: indicators),
            ],
          ),
        ),
      ),
    );
  }
}
