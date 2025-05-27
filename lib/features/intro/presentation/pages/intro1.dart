// ignore_for_file: prefer_const_constructors, unnecessary_import, sized_box_for_whitespace

import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/themes/theme.dart';
import 'package:app_yachay/core/widgets/buttons.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro2.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
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
                  ConstanceData.yachayPensando,
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'IA que se adapta a ti',
                        style: TextStyle(
                          color: HexColor('#E5E3FC'),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Nuestra inteligencia artificial comprende tu estilo de aprendizaje y crea contenido personalizado que desafía tu mente al nivel perfecto.',
                          textAlign: TextAlign.center,
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
                      MyIcon1(
                        bg: AppTheme.isLightTheme
                            ? HexColor('#FFE5E5')
                            : AppColors.secondaryDark,
                        click: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => IntroPage()),
                          );
                        },
                        icon: Ionicons.chevron_back,
                        icolor: AppColors.secondaryLight,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: HexColor('#E8E5FF'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.secondary,
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
                            MaterialPageRoute(builder: (_) => Intro2()),
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
