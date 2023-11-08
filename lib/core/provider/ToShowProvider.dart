import 'package:flutter/material.dart';

class ToShowProvider extends ChangeNotifier {
  bool? show;

  void updateAccountProvider(bool show) {
    this.show = show;
    notifyListeners();
  }
}
