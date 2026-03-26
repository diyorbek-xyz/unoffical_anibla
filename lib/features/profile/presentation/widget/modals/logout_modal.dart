import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:application/features/common/presentation/interactions/error_messenger.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showLogoutModal(
  BuildContext context, {
  required String tokenId,
  required bool isCurrent,
  String? deviceName,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) => BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogedOut) Navigator.pop(dialogContext);
          if (state is LogOutFailed) {
            ScaffoldMessenger.of(context).clearSnackBars();
            showErrorSnackbar(context, state.message);
          }
        },
        builder: (context, state) {
          final loading = state is AuthLoading;
          return AlertDialog(
            alignment: AlignmentGeometry.center,
            title: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Text(deviceName != null ? "Qurilma: $deviceName" : "Chiqish"),
                Align(
                  alignment: AlignmentGeometry.centerEnd,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
            constraints: BoxConstraints(maxWidth: 370, maxHeight: 270),
            content: Container(
              height: double.infinity,
              alignment: AlignmentGeometry.center,
              child: Text(
                deviceName != null
                    ? "Rostdan ushbu qurilmadan chiqmoqchimisiz"
                    : "Rostdan ham accountingizdan chiqmoqchimisiz?",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            contentPadding: EdgeInsetsGeometry.all(20),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                style: AppThemes.getErrorButtonStyle(context),
                onPressed: () => context.read<AuthBloc>().add(LogOutEvent(tokenId, isCurrent)),
                child: loading ? CircularProgressIndicator() : Text('Ha'),
              ),
              ElevatedButton(
                style: AppThemes.getPrimaryButtonStyle(context),
                onPressed: () => Navigator.pop(context),
                child: Text('Yoq'),
              ),
            ],
          );
        },
      ),
    ),
  );
}
