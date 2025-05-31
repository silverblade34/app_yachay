import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResponsive {
  // ============= SPACING =============
  // Espaciados comunes basados en tu LoginPage
  static double get spacing4 => 4.h;
  static double get spacing8 => 8.h;
  static double get spacing12 => 12.h;
  static double get spacing16 => 16.h;
  static double get spacing20 => 20.h;
  static double get spacing24 => 24.h;
  static double get spacing32 => 32.h;
  static double get spacing40 => 40.h;
  static double get spacing48 => 48.h;

  // ============= PADDING =============
  // Paddings basados en tus medidas existentes
  static EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get paddingAll => EdgeInsets.all(16.w);
  static EdgeInsets get paddingXRegular => EdgeInsets.all(13.w);
  static EdgeInsets get paddingSmall => EdgeInsets.all(8.w);
  static EdgeInsets get paddingXSmall => EdgeInsets.all(6.w);
  static EdgeInsets get paddingRegular => EdgeInsets.all(18.w);
  static EdgeInsets get paddingLarge => EdgeInsets.all(24.w);

  // Paddings personalizados
  static EdgeInsets paddingOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) =>
      EdgeInsets.only(
        left: (left ?? 0).w,
        top: (top ?? 0).h,
        right: (right ?? 0).w,
        bottom: (bottom ?? 0).h,
      );

  static EdgeInsets paddingSymmetric({
    double? horizontal,
    double? vertical,
  }) =>
      EdgeInsets.symmetric(
        horizontal: (horizontal ?? 0).w,
        vertical: (vertical ?? 0).h,
      );

  // ============= TAMAÑOS DE FUENTE =============
  // Basados en tus estilos existentes de AppFonts
  static double get fontSizeXSmall => 10.sp;
  static double get fontSizeSmall => 12.sp;
  static double get fontSizeMedium => 13.sp;
  static double get fontSizeRegular => 14.sp;
  static double get fontSizeLarge => 16.sp;
  static double get fontSizeXLarge => 18.sp;
  static double get fontSizeTitle => 23.sp;
  static double get fontSizeHeading => 28.sp;

  // ============= TAMAÑOS DE ICONOS =============
  static double get iconSizeSmall => 16.w;
  static double get iconSizeMedium => 20.w;
  static double get iconSizeRegular => 24.w;
  static double get iconSizeLarge => 32.w;
  static double get iconSizeXLarge => 40.w;

  // ============= BORDER RADIUS =============
  static double get radiusSmall => 4.r;
  static double get radiusMedium => 8.r;
  static double get radiusRegular => 12.r;
  static double get radiusLarge => 16.r;
  static double get radiusXLarge => 24.r;
  static double get radiusCircular => 50.r;

  // BorderRadius objects
  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(radiusSmall);
  static BorderRadius get borderRadiusMedium =>
      BorderRadius.circular(radiusMedium);
  static BorderRadius get borderRadiusRegular =>
      BorderRadius.circular(radiusRegular);
  static BorderRadius get borderRadiusLarge =>
      BorderRadius.circular(radiusLarge);
  static BorderRadius get borderRadiusXLarge =>
      BorderRadius.circular(radiusXLarge);

  // ============= ALTURAS DE COMPONENTES =============
  static double get buttonHeightSmall => 36.h;
  static double get buttonHeightMedium => 44.h;
  static double get buttonHeightLarge => 52.h;
  static double get textFieldHeight => 48.h;
  static double get appBarHeight => 56.h;
  static double get cardHeight => 120.h;

  // ============= ANCHOS DE COMPONENTES =============
  static double get buttonWidthSmall => 80.w;
  static double get buttonWidthMedium => 120.w;
  static double get buttonWidthLarge => 200.w;

  // ============= MÉTODOS UTILITARIOS =============

  static double getFullHeight(BuildContext context) {
    return 1.sh - MediaQuery.of(context).padding.top;
  }

  // Para obtener dimensiones personalizadas
  static double width(double size) => size.w;
  static double height(double size) => size.h;
  static double fontSize(double size) => size.sp;
  static double radius(double size) => size.r;

  // ============= SIZEDBOX PREDEFINIDOS =============
  static Widget get verticalSpace4 => SizedBox(height: spacing4);
  static Widget get verticalSpace8 => SizedBox(height: spacing8);
  static Widget get verticalSpace12 => SizedBox(height: spacing12);
  static Widget get verticalSpace16 => SizedBox(height: spacing16);
  static Widget get verticalSpace20 => SizedBox(height: spacing20);
  static Widget get verticalSpace24 => SizedBox(height: spacing24);
  static Widget get verticalSpace32 => SizedBox(height: spacing32);
  static Widget get verticalSpace40 => SizedBox(height: spacing40);

  static Widget get horizontalSpace4 => SizedBox(width: 4.w);
  static Widget get horizontalSpace8 => SizedBox(width: 8.w);
  static Widget get horizontalSpace12 => SizedBox(width: 12.w);
  static Widget get horizontalSpace16 => SizedBox(width: 16.w);
  static Widget get horizontalSpace20 => SizedBox(width: 20.w);
  static Widget get horizontalSpace24 => SizedBox(width: 24.w);

  // Métodos dinámicos para espacios
  static Widget verticalSpace(double height) => SizedBox(height: height.h);
  static Widget horizontalSpace(double width) => SizedBox(width: width.w);

  // ============= BREAKPOINTS RESPONSIVOS =============
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  // ============= CONTENEDORES RESPONSIVOS =============
  static Widget responsiveContainer({
    required Widget child,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color? color,
    double? width,
    double? height,
    BorderRadius? borderRadius,
  }) {
    return Container(
      width: width?.w,
      height: height?.h,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? borderRadiusRegular,
      ),
      child: child,
    );
  }

  // ============= MÉTODOS PARA TEXTO RESPONSIVO =============
  static TextStyle textStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize?.sp ?? fontSizeRegular,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  // Reemplaza tus estilos de AppFonts con estos métodos responsivos
  static TextStyle get titleIntroStyle => textStyle(
        fontSize: fontSizeHeading,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFE5E3FC),
      );

  static TextStyle descriptionIntroStyle({bool isLight = false}) => textStyle(
        fontSize: fontSizeRegular,
        color: isLight ? const Color(0xFF857FB4) : const Color(0xFFE5E3FC),
      );

  static TextStyle get titleLoginStyle => textStyle(
        fontSize: fontSizeTitle,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  static TextStyle get descriptionLoginStyle => textStyle(
        fontSize: fontSizeMedium,
        color: Colors.white70,
      );

  static TextStyle get checkboxTextStyle => textStyle(
        fontSize: fontSizeSmall,
        color: Colors.white70,
      );

  static TextStyle get linkTextStyle => textStyle(
        fontSize: fontSizeSmall,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      );
}
