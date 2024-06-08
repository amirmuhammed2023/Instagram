import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/generated/l10n.dart';

class AgreeTerms extends StatelessWidget {
  const AgreeTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_circle,
              color: AppColors.kCurveAppBar,
            ),
          ),
          Text(
            "${S.of(context).agree} ",
            style: const TextStyle(
              color: AppColors.kCurveAppBar,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            S.of(context).terms,
            style: const TextStyle(
              color: AppColors.kBorderTextField,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
