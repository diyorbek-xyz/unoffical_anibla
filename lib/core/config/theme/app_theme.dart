import 'package:application/core/config/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final darkTheme = _themeBuilder(AppColors.darkColorScheme);
  static final lightTheme = _themeBuilder(AppColors.lightColorScheme);

  static ThemeData _themeBuilder(ColorScheme colorScheme) => ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    fontFamily: GoogleFonts.googleSansFlex().fontFamily,
    pageTransitionsTheme: pageTransitions,
    splashColor: colorScheme.primary.withAlpha(25),
    highlightColor: colorScheme.primary.withAlpha(25),
    hoverColor: colorScheme.primary.withAlpha(25),
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
