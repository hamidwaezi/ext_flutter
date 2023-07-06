import 'package:flutter/material.dart';

extension ThemeExte on ThemeData {
  BorderRadiusGeometry get cardborderRadius => 
  (cardTheme.shape is RoundedRectangleBorder) ? (cardTheme.shape as RoundedRectangleBorder).borderRadius : BorderRadius.zero;
}
