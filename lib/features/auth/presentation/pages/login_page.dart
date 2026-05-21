import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:application/features/auth/presentation/widgets/login_form.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Kirish")),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            print(state.toString());
            if (state is ConfirmSuccess) context.pop();
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
