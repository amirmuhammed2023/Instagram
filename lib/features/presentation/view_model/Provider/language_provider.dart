import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool isarabic = false;
  bool isblue = true;

  changelanguage() {
    isarabic = !isarabic;
    notifyListeners();
  }

  changecolor() {
    isblue = !isblue;
    notifyListeners();
  }
}
