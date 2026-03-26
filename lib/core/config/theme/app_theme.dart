import 'package:application/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final pageTransitions = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    },
  );
  static final searchBarTheme = SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
    elevation: WidgetStatePropertyAll(0),
    shadowColor: WidgetStatePropertyAll(Colors.transparent),
  );

  static final darkTheme = ThemeData(
    colorScheme: AppColors.darkColorScheme,
    useMaterial3: true,
    fontFamily: GoogleFonts.googleSansFlex().fontFamily,
  );
  static final lightTheme = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    useMaterial3: true,
    fontFamily: GoogleFonts.googleSansFlex().fontFamily,
  );
}
