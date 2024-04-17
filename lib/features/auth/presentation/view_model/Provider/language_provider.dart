import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool isarabic = false;

  changelanguage() {
    isarabic = !isarabic;
    notifyListeners();
  }
}
