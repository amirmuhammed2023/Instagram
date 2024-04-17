import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/core/utils/functions/border_text_field.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.validator});
  final String hinttext;
  final String? Function(String?) validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: kBorderTextField(),
        focusedBorder: kBorderTextField(),
        hintText: hinttext,
        hintStyle: const TextStyle(
            color: AppColors.kCurveAppBar,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
