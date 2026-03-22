import 'package:application/core/utils/utils.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final loading = state is AuthLoading;
          return Center(
            child: Container(
              width: 500,
              height: 600,
              alignment: AlignmentGeometry.center,
              child: Column(
                spacing: 20,
                children: [
                  Text("Login with Phone", style: TextStyle(fontSize: 30)),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                    onPressed: () => sl<AuthBloc>().add(LoginEvent(LoginRequestModel(phoneController.text.parseInt()))),
                    child: loading ? CircularProgressIndicator() : Text("Send Code"),
                  ),
                  TextField(
                    controller: confirmController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                    onPressed: () => sl<AuthBloc>().add(
                      ConfirmEvent(ConfirmModel(login: phoneController.text.parseInt(), code: confirmController.text.parseInt())),
                    ),
                    child: loading ? CircularProgressIndicator() : Text("Confirm Code"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
