import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/clipper_section.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/login_form_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ClipperSection(),
          LoginFormSection(),
        ],
      ),
    );
  }
}
