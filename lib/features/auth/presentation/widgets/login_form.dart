import 'package:application/core/utils/utils.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final phoneController = TextEditingController();
  final confirmController = TextEditingController();

  void getConfirmCode(BuildContext context) {
    context.read<AuthBloc>().add(
      LoginEvent(
        LoginRequestModel(phoneController.text.isNotEmpty ? phoneController.text.parseInt() : 0),
      ),
    );
  }

  void confirmCode(BuildContext context) {
    context.read<AuthBloc>().add(
      ConfirmEvent(
        ConfirmModel(
          code: confirmController.text.parseInt(),
          login: phoneController.text.parseInt(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final loading = state is AuthLoading;
        final receivedCode = state is LoginSuccess;
        final receivedFailed = state is LoginFailed;
        final codeCorrect = state is ConfirmSuccess;
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
                  keyboardType: TextInputType.phone,
                  enabled: !receivedCode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                  ),
                ),
                if (receivedFailed)
                  Text(state.exception.message.toString(), style: TextStyle(color: Colors.red)),
                if (!receivedCode && !codeCorrect)
                  ElevatedButton(
                    onPressed: () => getConfirmCode(context),
                    child: loading ? CircularProgressIndicator() : Text("Send Code"),
                  ),
                if (receivedCode || codeCorrect)
                  TextField(
                    controller: confirmController,
                    keyboardType: TextInputType.number,
                    enabled: (!codeCorrect || !receivedCode),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.sms),
                    ),
                  ),
                if (receivedCode && !codeCorrect)
                  ElevatedButton(
                    onPressed: () => confirmCode(context),
                    child: loading ? CircularProgressIndicator() : Text("Confirm Code"),
                  ),
                if (codeCorrect) Text(state.data.token.accessToken),
              ],
            ),
          ),
        );
      },
    );
  }
}
