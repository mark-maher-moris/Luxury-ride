import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color toHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension AppContext on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  Future push(Widget page) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  Future pushReplacement(Widget page) {
    return Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => page));
  }

  void pop() {
    return Navigator.pop(this);
  }

  Future pushNamed(String routeName) {
    return Navigator.pushNamed(this, routeName);
  }
}
