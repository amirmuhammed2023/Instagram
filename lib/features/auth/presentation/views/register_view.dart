import 'package:flutter/material.dart';
import 'package:logandregister/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
