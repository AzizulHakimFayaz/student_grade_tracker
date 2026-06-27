import 'package:flutter/material.dart';

class AppTheme {
  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1F6A8A),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD6F0FF),
    onPrimaryContainer: Color(0xFF063247),
    secondary: Color(0xFF6C5CE7),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE7E2FF),
    onSecondaryContainer: Color(0xFF241A6B),
    tertiary: Color(0xFF00856F),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBDEFE4),
    onTertiaryContainer: Color(0xFF003D33),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFF8FAFC),
    onSurface: Color(0xFF182026),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF0F4F8),
    surfaceContainer: Color(0xFFE8EEF3),
    surfaceContainerHigh: Color(0xFFDDE6ED),
    surfaceContainerHighest: Color(0xFFD2DDE6),
    onSurfaceVariant: Color(0xFF4D5B66),
    outline: Color(0xFF768690),
    outlineVariant: Color(0xFFC0CCD4),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF2D3135),
    onInverseSurface: Color(0xFFEFF2F5),
    inversePrimary: Color(0xFF9CD6F0),
    surfaceTint: Color(0xFF1F6A8A),
  );

  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF9CD6F0),
    onPrimary: Color(0xFF003449),
    primaryContainer: Color(0xFF0D4E68),
    onPrimaryContainer: Color(0xFFD6F0FF),
    secondary: Color(0xFFC8BEFF),
    onSecondary: Color(0xFF34248A),
    secondaryContainer: Color(0xFF4C3FB8),
    onSecondaryContainer: Color(0xFFE7E2FF),
    tertiary: Color(0xFF73DDC7),
    onTertiary: Color(0xFF00382E),
    tertiaryContainer: Color(0xFF005446),
    onTertiaryContainer: Color(0xFFBDEFE4),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF12171B),
    onSurface: Color(0xFFE3E9EE),
    surfaceContainerLowest: Color(0xFF0D1114),
    surfaceContainerLow: Color(0xFF192126),
    surfaceContainer: Color(0xFF202A30),
    surfaceContainerHigh: Color(0xFF2A353C),
    surfaceContainerHighest: Color(0xFF354149),
    onSurfaceVariant: Color(0xFFB9C7D1),
    outline: Color(0xFF83919B),
    outlineVariant: Color(0xFF3D4A52),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE3E9EE),
    onInverseSurface: Color(0xFF202A30),
    inversePrimary: Color(0xFF1F6A8A),
    surfaceTint: Color(0xFF9CD6F0),
  );

  static ThemeData get light => _buildTheme(_lightScheme);

  static ThemeData get dark => _buildTheme(_darkScheme);

  static ThemeData _buildTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surfaceContainerLowest,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLowest,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerLowest,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(scheme.primary),
          foregroundColor: WidgetStatePropertyAll<Color>(scheme.onPrimary),
          minimumSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(52)),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: TextStyle(color: scheme.onInverseSurface),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
