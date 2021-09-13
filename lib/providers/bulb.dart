import 'package:flutter/material.dart';

class BulbColor with ChangeNotifier {
  Color _bulbColor = Colors.amber;
  double _opacity = 100.00;

  void changeColor(Color color) {
    _bulbColor = color;
    notifyListeners();
  }

  void changeOpacity(double value) {
    _opacity = value;
    notifyListeners();
  }

  double get opacity {
    return _opacity;
  }

  Color get bulbColor {
    return _bulbColor;
  }
}
