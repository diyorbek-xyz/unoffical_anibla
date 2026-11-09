import 'package:application/core/config/theme/app_colors.dart';
import 'package:material_ui/material_ui.dart';

void showErrorSnackbar(BuildContext context, String message) => ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    behavior: SnackBarBehavior.floating,
    width: 500,
    backgroundColor: context.colors.errorContainer,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        Icon(Icons.error, color: context.colors.onError),
        Text(message, style: TextStyle(color: context.colors.onError, fontSize: 18)),
      ],
    ),
  ),
);
