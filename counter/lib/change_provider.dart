import 'package:flutter/material.dart';

class ChangeProvider with ChangeNotifier {
  int counter = 0;
  void increaser() {
    counter = counter + 1;
    notifyListeners();
  }
}
