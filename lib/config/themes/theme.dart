import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static bool isLightTheme = false;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base, bool isLight) {
    return base.copyWith(
      titleLarge: TextStyle(
        fontSize: 23,
        fontFamily: 'Poppins',
        color: isLight ? AppColors.textLight : AppColors.textDarkTitle,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Poppins',
        color: isLight ? AppColors.textLight : AppColors.textDark,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 17,
        fontFamily: 'Poppins',
        color: isLight ? AppColors.textLight : AppColors.textDark,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
        color: isLight ? AppColors.textLight : AppColors.textDark,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontFamily: 'Poppins',
        color: isLight ? AppColors.textLight : AppColors.textDark,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        color: isLight ? AppColors.textLight : AppColors.textDarkSubtitle,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      // Esquema de colores global (importante para Material 3)
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.backgroundLight, // Fondo del Scaffold
        onPrimary: AppColors.textDark, // Color de texto/iconos sobre el color primario
        onSecondary: AppColors.textDark, // Color de texto/iconos sobre el color secundario
        onSurface: AppColors.textLight, // Color de texto/iconos sobre el fondo
        error: Colors.red, // Color para errores
        onError: Colors.white, // Texto/iconos sobre color de error
      ),
      iconTheme: IconThemeData(color: AppColors.iconLight),
      primaryColor: AppColors.primary, // Aunque ColorScheme es el preferido, primaryColor aún se usa en algunos widgets
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: _buildTextTheme(base.textTheme, true), // Pasa 'true' para tema claro
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme, true),

      // Tema para los campos de entrada de texto (TextField)
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.backgroundLight, // Fondo del campo (si filled es true)
        filled: true, // Importante para que fillColor se aplique
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Bordes más redondeados
          // ignore: deprecated_member_use
          borderSide: BorderSide(color: AppColors.textLight.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          // ignore: deprecated_member_use
          borderSide: BorderSide(color: AppColors.textLight.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.primary, width: 2.0), // Borde principal al enfocar
        ),
        // ignore: deprecated_member_use
        labelStyle: TextStyle(color: AppColors.textLight.withOpacity(0.7)),
        // ignore: deprecated_member_use
        hintStyle: TextStyle(color: AppColors.textLight.withOpacity(0.5)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),

      // Tema para Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary, // Fondo del botón
          foregroundColor: AppColors.textDark, // Color del texto/icono del botón
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),

      // Tema para Text Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary, // Color del texto/icono del botón
          textStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Tema para AppBars
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0, // Sin sombra para un look moderno
        titleTextStyle: _buildTextTheme(base.textTheme, true).titleLarge?.copyWith(color: AppColors.textLight),
        iconTheme: IconThemeData(color: AppColors.iconLight),
        actionsIconTheme: IconThemeData(color: AppColors.iconLight), // Iconos de acción
      ),

      // Tema para Tarjetas (Cards)
      cardTheme: CardTheme(
        color: AppColors.backgroundLight,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Bordes ligeramente más redondeados
        ),
        margin: EdgeInsets.all(8.0), // Margen por defecto
      ),

      // Tema para BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundLight,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textLight.withOpacity(0.6),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        unselectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
      ),
      // Puedes añadir más propiedades de tema aquí según sea necesario (ej. dialogTheme, tabBarTheme, tooltipTheme, etc.)
    );
  }

  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      // Esquema de colores global para Material 3
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.backgroundDark, // Superficie de Cards, Sheets, etc.
        onPrimary: AppColors.textDark,
        onSecondary: AppColors.textDark,
        onSurface: AppColors.textDark,
        error: Colors.redAccent,
        onError: Colors.black, // Texto/iconos sobre color de error
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.backgroundDarkIntense, // Un color de fondo oscuro de tu paleta
        elevation: 0,
        titleTextStyle: _buildTextTheme(base.textTheme, false).titleLarge?.copyWith(color: AppColors.textDarkTitle),
        iconTheme: IconThemeData(color: AppColors.iconDark),
        actionsIconTheme: IconThemeData(color: AppColors.iconDark),
      ),
      iconTheme: IconThemeData(color: AppColors.iconDark),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDarkIntense,
      textTheme: _buildTextTheme(base.textTheme, false), // Pasa 'false' para tema oscuro
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme, false),

      // Tema para los campos de entrada de texto (TextField) en modo oscuro
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.backgroundDark, // Un tono ligeramente más claro para los campos que el fondo del scaffold
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.textDark.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.textDark.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        labelStyle: TextStyle(color: AppColors.textDark.withOpacity(0.7)),
        hintStyle: TextStyle(color: AppColors.textDark.withOpacity(0.5)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),

      // Tema para Elevated Buttons en modo oscuro
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),

      // Tema para Text Buttons en modo oscuro
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Tema para Tarjetas (Cards) en modo oscuro
      cardTheme: CardTheme(
        color: AppColors.backgroundDark, // Ligeramente más claro que el scaffold para diferenciar
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: EdgeInsets.all(8.0),
      ),

      // Tema para BottomNavigationBar en modo oscuro
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDarkIntense,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textDarkSubtitle.withOpacity(0.6),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        unselectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }
}