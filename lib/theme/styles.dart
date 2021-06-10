import 'package:flutter/material.dart';

// todo check Theme.of
abstract class ThemeText {
  static const TextStyle header = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subTitle = TextStyle(
    fontSize: 20,
  );
  static const TextStyle tabText = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );
  static const TextStyle tableTh = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle tableTd = TextStyle(
    fontSize: 18,
  );
}