import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logandregister/features/auth/presentation/view_model/Provider/language_provider.dart';
import 'package:logandregister/features/auth/presentation/views/register_view.dart';
import 'package:logandregister/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return LanguageProvider();
      },
      child: const LogAndRegister(),
    ),
  );
}

class LogAndRegister extends StatelessWidget {
  const LogAndRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final providerlanguage = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: providerlanguage.isarabic == false ? Locale("en") : Locale("ar"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: RegisterView(),
    );
  }
}
