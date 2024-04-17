import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/core/utils/app_validator.dart';
import 'package:logandregister/features/auth/presentation/views/widgets/agree_terms.dart';
import 'package:logandregister/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:logandregister/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:logandregister/generated/l10n.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterFormSection> {
  late TextEditingController usernamecontrol;
  late TextEditingController fullnamecontrol;
  late TextEditingController emailcontrol;
  late TextEditingController passwordcontrol;
  late GlobalKey<FormState> globalkeyy;

  @override
  void initState() {
    globalkeyy = GlobalKey();
    usernamecontrol = TextEditingController();
    fullnamecontrol = TextEditingController();
    emailcontrol = TextEditingController();
    passwordcontrol = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernamecontrol.dispose();
    fullnamecontrol.dispose();
    emailcontrol.dispose();
    passwordcontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: globalkeyy,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
            CustomTextField(
              hinttext: S.of(context).username,
              validator: (uname) {
                return AppValidator.usernameValidator(uname!);
              },
              controller: usernamecontrol,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hinttext: S.of(context).fullname,
              validator: (fname) {
                return AppValidator.fullnameValidator(fname!);
              },
              controller: fullnamecontrol,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hinttext: S.of(context).email,
              validator: (em) {
                return AppValidator.emailValidator(em!);
              },
              controller: emailcontrol,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hinttext: S.of(context).password,
              validator: (pas) {
                return AppValidator.passwordValidator(pas!);
              },
              controller: passwordcontrol,
            ),
            const SizedBox(height: 30),
            const AgreeTerms(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
            CustomElevatedButton(
              onPressed: () {
                if (globalkeyy.currentState!.validate()) {
                  print("true");
                } else {
                  print("false");
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).member,
              style: const TextStyle(
                color: AppColors.kCurveAppBar,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          ],
        ),
      ),
    );
  }
}
