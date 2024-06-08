import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_validator.dart';
import 'package:logandregister/features/data/my_fire_auth.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/agree_terms.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/custom_elevated_button.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/custom_text_field.dart';
import 'package:logandregister/features/presentation/views/my_pages_view.dart';
import 'package:logandregister/generated/l10n.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  late TextEditingController emailcontrol;
  late TextEditingController passwordcontrol;
  late GlobalKey<FormState> globalkey;
  final myfireauth = MyFireAuth();
  @override
  void initState() {
    globalkey = GlobalKey();
    emailcontrol = TextEditingController();
    passwordcontrol = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailcontrol.dispose();
    passwordcontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final getDataInstance = Provider.of<GettedDataProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: globalkey,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
            CustomTextField(
              hinttext: S.of(context).email,
              validator: (eml) {
                return AppValidator.emailValidator(eml!);
              },
              controller: emailcontrol,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hinttext: S.of(context).password,
              validator: (pass) {
                return AppValidator.passwordValidator(pass!);
              },
              controller: passwordcontrol,
            ),
            const SizedBox(height: 30),
            const AgreeTerms(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
            CustomElevatedButton(
              text: S.of(context).signin,
              onPressed: () async {
                if (globalkey.currentState!.validate()) {
                  myfireauth.logindata(
                    email: emailcontrol.text,
                    password: passwordcontrol.text,
                    gotopage: MyPagesView.id,
                    context: context,
                  );
                  // await getDataInstance
                  //     .getUserDataFi(FirebaseAuth.instance.currentUser!.uid);
                  // log("my id is : ${myfireauth.auth.currentUser?.uid}");

                  // log("my id is is: ${FirebaseAuth.instance.currentUser!.uid}");
                  //============================
                  // await myfireauth.getData(
                  //   myfireauth.auth.currentUser?.uid ?? "ccc",
                  // );
                  // log("my map : ${myfireauth.userData.toString()}");
                } else {
                  log("Error validator");
                }
              },
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          ],
        ),
      ),
    );
  }
}
