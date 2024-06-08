import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';

class CustomCirculeIndicator extends StatelessWidget {
  const CustomCirculeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.kBorderTextField,
        backgroundColor: AppColors.kBackground,
      ),
    );
  }
}
