import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:application/features/auth/presentation/widgets/region_selector.dart';
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
  Region current = regions.first;

  void changeRegion(Region reg) {
    setState(() => current = reg);
  }

  void getConfirmCode(BuildContext context) {
    context.read<AuthBloc>().add(
      LoginEvent(LoginRequestModel(phoneController.text.isNotEmpty ? "${current.code}${phoneController.text}".parseInt() : 0)),
    );
  }

  void confirmCode(BuildContext context) {
    context.read<AuthBloc>().add(
      ConfirmEvent(ConfirmModel(code: confirmController.text.parseInt(), login: "${current.code}${phoneController.text}".parseInt())),
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
        final codeFailed = state is ConfirmFailed;
        final buttonStyle = ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(100, 54)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(7))),
          textStyle: WidgetStatePropertyAll(context.textTheme.titleMedium),
        );
        return Center(
          child: SizedBox(
            width: 400,
            child: Column(
              spacing: 20,
              crossAxisAlignment: .stretch,
              mainAxisAlignment: .center,
              children: [
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  enabled: !receivedCode && !codeFailed,
                  maxLength: 9,
                  buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
                  onSubmitted: (value) => getConfirmCode(context),
                  decoration: InputDecoration(
                    prefix: RegionSelector(changeRegion: changeRegion, current: current),
                    label: Text("Telefon raqam"),
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                  ),
                ),
                TextField(
                  controller: confirmController,
                  keyboardType: TextInputType.number,
                  enabled: receivedCode || codeFailed,
                  onSubmitted: (value) => confirmCode(context),
                  decoration: InputDecoration(label: Text("SMS kod"), border: OutlineInputBorder(), icon: Icon(Icons.sms)),
                ),
                if (receivedFailed) Text(state.message.toString(), style: TextStyle(color: Colors.red)),
                if (!receivedCode && !codeCorrect && !codeFailed)
                  ElevatedButton(
                    onPressed: () => getConfirmCode(context),
                    style: buttonStyle,
                    child: loading ? CircularProgressIndicator(constraints: BoxConstraints.tightFor(height: 20, width: 20)) : Text("Send Code"),
                  ),
                if ((receivedCode || codeFailed) && !codeCorrect)
                  ElevatedButton(
                    onPressed: () => confirmCode(context),
                    style: buttonStyle,
                    child: loading ? CircularProgressIndicator() : Text("Confirm Code"),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
