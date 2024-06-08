import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/presentation/view_model/Provider/language_provider.dart';
import 'package:logandregister/features/presentation/views/auth/login_view.dart';
import 'package:logandregister/features/presentation/views/auth/register_view.dart';
import 'package:logandregister/generated/l10n.dart';
import 'package:provider/provider.dart';

class AuthPages extends StatelessWidget {
  const AuthPages({super.key});

  @override
  Widget build(BuildContext context) {
    final colorprovider = Provider.of<LanguageProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            // colorprovider.changecolor();
            Navigator.pushNamed(context, RegisterView.id);
          },
          child: Text(
            S.of(context).signup,
            style: TextStyle(
              color: colorprovider.isblue == true
                  ? AppColors.kCurveAppBar
                  : AppColors.kBorderTextField,
              fontSize: 18,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            colorprovider.changecolor();
            Navigator.pushNamed(context, LoginView.id);
          },
          child: Text(
            S.of(context).signin,
            style: TextStyle(
              color: colorprovider.isblue == true
                  ? AppColors.kBorderTextField
                  : AppColors.kCurveAppBar,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
