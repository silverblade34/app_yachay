// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/themes/theme.dart';
import 'package:app_yachay/core/widgets/buttons.dart';
import 'package:app_yachay/features/intro/controllers/intro_controller.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro1.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Container(height: AppBar().preferredSize.height),
                Image.asset(
                  ConstanceData.yachayCelular,
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Aprende desde cualquier lugar',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: HexColor('#E5E3FC'),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Convierte cada momento libre en una oportunidad de crecimiento. Con Yachay, tu conocimiento viaja contigo las 24 horas del día.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.isLightTheme
                              ? HexColor('#857FB4')
                              : HexColor('#E5E3FC'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 60),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.secondary,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: HexColor('#E8E5FF'),
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: HexColor('#E8E5FF'),
                            ),
                          ),
                        ],
                      ),
                      MyIcon(
                        click: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Intro1()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
