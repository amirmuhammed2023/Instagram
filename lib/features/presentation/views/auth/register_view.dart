import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const id = "/RegisterView";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
