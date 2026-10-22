import 'package:flutter/material.dart';
import 'package:ukkmate/features/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen(initialIsLogin: false);
  }
}
