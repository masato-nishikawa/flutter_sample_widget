import 'package:flutter/material.dart';

extension HexColor on String {
  Color toColor() {
    final hex = replaceFirst('#', '');
    final hexColor = hex.length == 6 ? 'FF$hex' : hex;
    return Color(int.parse('0x$hexColor'));
  }
}