import 'package:application/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    colorScheme: AppColors.darkColorScheme,
    useMaterial3: true,
    elevatedButtonTheme: elevatedButtonTheme,
    fontFamily: GoogleFonts.googleSansFlex().fontFamily,
  );
  static final lightTheme = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    useMaterial3: true,
    fontFamily: GoogleFonts.googleSansFlex().fontFamily,
  );

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

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15,vertical: 5)),
      maximumSize: WidgetStatePropertyAll(Size(160, 50)),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
      mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
      shape: WidgetStateProperty.fromMap({
        WidgetState.pressed: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
        WidgetState.any: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(7)),
      }),
    ),
  );
  static ButtonStyle getErrorButtonStyle(BuildContext context) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(context.appColors.error),
    foregroundColor: WidgetStatePropertyAll(context.appColors.onError),
  );

  static ButtonStyle getPrimaryButtonStyle(BuildContext context) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(context.appColors.primary),
    foregroundColor: WidgetStatePropertyAll(context.appColors.onPrimary),
  );
}
