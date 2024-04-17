import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/auth/presentation/view_model/Provider/language_provider.dart';
import 'package:provider/provider.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final providerlanguage = Provider.of<LanguageProvider>(context);
    return SwitchListTile(
      value: providerlanguage.isarabic,
      title: providerlanguage.isarabic == true
          ? const Text(
              "عربي",
              style: TextStyle(
                color: AppColors.kBackground,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          : const Text(
              "English",
              style: TextStyle(
                color: AppColors.kBackground,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
      onChanged: (val) {
        providerlanguage.changelanguage();
      },
    );
  }
}
