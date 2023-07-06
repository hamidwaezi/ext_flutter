import 'package:flutter/material.dart';

class ColorSchemeExtention {
  static Color warning = Colors.orange;
  static Color success = Colors.green;
  static Color onWarning = Colors.white;
  static Color onSuccess = Colors.white;
}

extension ColorSchemeExt on ColorScheme {
  Color get warrning => ColorSchemeExtention.warning;
  Color get success => ColorSchemeExtention.success;
  Color get onWarning => ColorSchemeExtention.onWarning;
  Color get onSuccess => ColorSchemeExtention.onSuccess;
}
