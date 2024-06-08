import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logandregister/features/data/my_fire_auth.dart';
import 'package:logandregister/features/data/my_fire_storage.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_post_data_provider.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:logandregister/features/presentation/view_model/Provider/language_provider.dart';
import 'package:logandregister/features/presentation/views/auth/login_view.dart';
import 'package:logandregister/features/presentation/views/auth/register_view.dart';
import 'package:logandregister/features/presentation/views/comments_view.dart';
import 'package:logandregister/features/presentation/views/my_pages_view.dart';
import 'package:logandregister/firebase_options.dart';
import 'package:logandregister/generated/l10n.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return LanguageProvider();
        },
      ),
      ChangeNotifierProvider(
        create: (context) {
          return GettedUserDataProvider(MyFireAuth());
        },
      ),
      ChangeNotifierProvider(
        create: (context) {
          return GettedPostDataProvider(MyFireStorage());
        },
      ),
    ],
    child: const InstagramApp(),
  ));
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    final providerlanguage = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: providerlanguage.isarabic == false
          ? const Locale("en")
          : const Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const RegisterView(),
      routes: {
        MyPagesView.id: (context) => const MyPagesView(),
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        CommentsView.id: (context) => const CommentsView(),
      },
    );
  }
}
