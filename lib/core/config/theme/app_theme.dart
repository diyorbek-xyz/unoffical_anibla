import 'package:application/core/config/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    colorScheme: AppColors.darkColorScheme,
    useMaterial3: true,
    fontFamily: GoogleFonts.googleSansFlex().fontFamily,
    pageTransitionsTheme: pageTransitions,
  );
  static final lightTheme = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    useMaterial3: true,
    fontFamily: GoogleFonts.googleSansFlex().fontFamily,
    pageTransitionsTheme: pageTransitions,
  );

  static final pageTransitions = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    },
  );
  static final searchBarTheme = SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
    elevation: WidgetStatePropertyAll(0),
    shadowColor: WidgetStatePropertyAll(Colors.transparent),
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

extension FontSize on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ButtonStyles get buttonVariant => ButtonStyles(this);
}

class ButtonStyles {
  final BuildContext context;
  const ButtonStyles(this.context);

  ButtonStyle get rectangle => ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size(100, 50)),
    maximumSize: WidgetStatePropertyAll(Size(double.infinity, 60)),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(7))),
    textStyle: WidgetStatePropertyAll(context.textTheme.titleMedium),
  );
}
