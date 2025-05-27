import 'package:flutter/material.dart';

class AppColors {
  // --- Paleta Principal basada en la mascota Yachay ---

  // Color Primario: El turquesa vibrante de la llama
  static const Color primary = Color.fromARGB(255, 54, 143, 137);
  static const Color primaryDark = Color.fromARGB(255, 26, 102, 97);

  // Color Secundario/Acento: El rojo intenso del poncho
  static const Color secondary = Color(0xFFD14141);
  static const Color secondaryDark = Color.fromARGB(255, 97, 62, 62);
  static const Color secondaryLight = Color.fromARGB(255, 203, 125, 125);

  // Color de Acento Adicional: Un tono dorado/bronceado del libro y detalles de la llama
  // Útil para elementos sutiles, estados deshabilitados o acentos cálidos.
  static const Color accent = Color(0xFFEFC96A);

  // --- Colores de Fondo ---

  // Fondo para Temas Claros: Un blanco muy suave, casi crema
  static const Color backgroundLight = Color(0xFFFBFBFB);

  // Fondo para Temas Oscuros: Un azul-gris oscuro y sofisticado, complementa el turquesa y rojo
  static const Color backgroundDark = Color(0xFF1A2B3B);

  // Fondo Oscuro Intenso: Aún más oscuro para elementos como AppBars, tarjetas o diálogos en modo oscuro
  static const Color backgroundDarkIntense = Color(0xFF0E1A2B);

  // Fondo Oscuro Ligero/Transparente: Para superposiciones o diálogos con cierta transparencia
  static const Color backgroundDarkLigth =
      Color.fromARGB(128, 26, 43, 59); // 50% opacidad del backgroundDark

  // --- Colores de Texto ---

  // Texto para Fondos Claros: Un color oscuro (similar al backgroundDark) para buena legibilidad
  static const Color textLight = Color(0xFF1A2B3B);

  // Texto para Fondos Oscuros: Blanco suave para el texto principal
  static const Color textDark = Color(0xFFFBFBFB);

  // Títulos para Fondos Oscuros: Blanco un poco menos intenso, para jerarquía
  static const Color textDarkTitle = Color(0xFFF0EFEF);

  // Subtítulos para Fondos Oscuros: Un gris medio para subtítulos y texto menos prominente
  static const Color textDarkSubtitle = Color(0xFF9AA8B7);

  // --- Colores de Iconos ---

  // Iconos para Fondos Claros
  static const Color iconLight = Color(0xFF1A2B3B);

  // Iconos para Fondos Oscuros
  static const Color iconDark = Color(0xFFFBFBFB);

  // --- Otros ---

  // Color de Fondo para Diálogos en Modo Oscuro (consistente con backgroundDarkIntense)
  static const Color backgroundDialogDark = Color(0xFF0E1A2B);

  // Colores para efecto Shimmer (se pueden ajustar si es necesario, pero estos son estándar)
  // ignore: deprecated_member_use
  static Color shimmerBaseColor = Colors.grey.withOpacity(0.3);
  // ignore: deprecated_member_use
  static Color shimmerHighlightColor = Colors.grey.withOpacity(0.2);
}

// Clase de utilidad para convertir códigos hexadecimales en colores (ya estaba, mantenida)
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
