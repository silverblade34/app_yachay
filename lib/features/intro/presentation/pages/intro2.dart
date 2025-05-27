import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/constance.dart';
import 'package:app_yachay/config/themes/theme.dart';
import 'package:app_yachay/core/widgets/buttons.dart';
import 'package:app_yachay/features/intro/presentation/pages/intro1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
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
                  ConstanceData.yachayCelebrando,
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Celebra cada logro',
                        style: TextStyle(
                          color: HexColor('#E5E3FC'),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Cada respuesta correcta, cada nivel completado, cada meta alcanzada. En Yachay, tu progreso se convierte en una fiesta de conocimiento.',
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
                            MaterialPageRoute(builder: (_) => Intro1()),
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
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: HexColor('#E8E5FF'),
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                      MyIcon(
                        click: () {
                          Get.toNamed("profile_configuration");
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
