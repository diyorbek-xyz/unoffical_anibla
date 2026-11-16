import 'package:application/core/config/theme/app_colors.dart';
import 'package:material_ui/material_ui.dart';

void showErrorSnackbar(BuildContext context, String message) => ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    behavior: SnackBarBehavior.floating,
    width: 500,
    duration: Duration(seconds: 10),
    backgroundColor: context.colors.errorContainer,
    content: Text(message, style: .new(color: context.colors.onErrorContainer)),
  ),
);
