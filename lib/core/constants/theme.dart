import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

Color primary = Colors.amber;
Color primaryDark = Colors.amber.shade900;
Color primaryTint = Colors.amberAccent.withValues(alpha: 0.2);
Color onPrimary = Colors.white;

Color surface = Color(0xFF202028);
Color onSurface = Colors.white;

Color secondary = Colors.teal;
Color onSecondary = Colors.white;

Color error = Colors.red;
Color onError = Colors.white;

final colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryDark,
  onPrimary: onPrimary,
  secondary: secondary,
  onSecondary: onSecondary,
  error: error,
  onError: onError,
  surface: surface,
  onSurface: onSurface,
);

final pageTransitions = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
  },
);

final searchBarTheme = SearchBarThemeData(
  backgroundColor: WidgetStatePropertyAll(secondary),
  elevation: WidgetStatePropertyAll(0),
  shadowColor: WidgetStatePropertyAll(Colors.transparent),
);

final themeData = ThemeData(
  pageTransitionsTheme: pageTransitions,
  searchBarTheme: searchBarTheme,
  colorScheme: colorScheme,
  fontFamily: GoogleFonts.googleSansFlex().fontFamily,
);

final pulseEffect = PulseEffect(from: Colors.white, to: Colors.white10);