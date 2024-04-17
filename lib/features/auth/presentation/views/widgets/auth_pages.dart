import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/generated/l10n.dart';

class AuthPages extends StatelessWidget {
  const AuthPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).signup,
            style: const TextStyle(
              color: AppColors.kCurveAppBar,
              fontSize: 18,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).signin,
            style: const TextStyle(
              color: AppColors.kBorderTextField,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
