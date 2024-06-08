import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/clipper_section.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/register_form_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ClipperSection(),
          RegisterFormSection(),
        ],
      ),
    );
  }
}
