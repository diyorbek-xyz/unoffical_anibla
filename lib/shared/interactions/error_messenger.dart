import 'package:application/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String message) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 500,
        backgroundColor: context.appColors.errorContainer,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            Icon(Icons.error,color: context.appColors.onError,),
            Text(message, style: TextStyle(color: context.appColors.onError, fontSize: 18)),
          ],
        ),
      ),
    );
