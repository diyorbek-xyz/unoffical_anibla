import 'dart:ui';

import 'package:application/core/constants/theme.dart';
import 'package:application/data/models/auth/verify.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/auth/auth_bloc.dart';
import 'package:application/presentation/bloc/auth/auth_event.dart';
import 'package:application/presentation/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        body: Container(
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 180, child: Image.asset("assets/images/logo_circle.png")),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: AlignmentGeometry.center,
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text("Kirish uchun royxatdan oting", style: TextStyle(fontSize: 20)),
                      ),
                      TextField(
                        autocorrect: true,
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: _emailController,
                        decoration: _decorationBuilder(hint: "Telefon raqamingizni kiriting", label: "Telefon"),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: _decorationBuilder(hint: "Tasdiqlash kod kirting", label: "Kod"),
                        autocorrect: false,
                      ),
                      OverflowBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bu funksiya hali ishlamaydi"))),
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(vertical: 5),
                              child: Text("Parolni unutdingizmi?", style: TextStyle(color: primaryDark)),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(vertical: 5),
                              child: Text("Yangi account ochish", style: TextStyle(color: primaryDark)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                    return _button(
                      text: state is AuthStateLoading ? "Loading..." : "Kirish",
                      onPressed: () => context.read<AuthBloc>().add(
                        VerifyEvent(VerifyModel(code: _passwordController.text, phoneNumber: int.parse(_emailController.text))),
                      ),
                    );
                  return _button(
                    onPressed: () => context.read<AuthBloc>().add(LoginEvent(int.parse(_emailController.text))),
                    color: primaryDark,
                    text: state is AuthStateLoading ? "Loading..." : "Kodni yuborish",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _decorationBuilder({String? label, String? hint}) {
    return InputDecoration(border: OutlineInputBorder(), alignLabelWithHint: true, label: Text("$label"), hint: Text("$hint"));
  }

  Widget _button({required String text, required Function onPressed, Color? color}) {
    Color tintColor = Color.lerp(ColorScheme.of(context).surface.withValues(alpha: 0.1), Colors.white, 0.15)!;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: tintColor,
      focusColor: tintColor,
      hoverColor: tintColor,
      highlightColor: tintColor,
      onTap: () => onPressed(),
      child: Ink(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
        width: double.infinity,
        height: 50,
        child: Container(
          alignment: AlignmentGeometry.center,
          child: Text(text, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
