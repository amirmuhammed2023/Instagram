import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const id = "/LoginView";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
