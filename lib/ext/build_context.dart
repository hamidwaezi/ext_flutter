import 'package:flutter/material.dart';

extension AppHelper on BuildContext {
  double get scale => switch (sizeX.shortestSide) {
        < 320 => 0.9,
        >= 320 && < 600 => 0.95,
        >= 600 && < 960 => 1,
        >= 1200 => 1.1,
        _ => 1.15,
      };

  void closeKeyboard() => FocusScope.of(this).unfocus();

  // Returns the MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  ///
  Size get sizeX => MediaQuery.sizeOf(this);

  /// Returns same as MediaQuery.of(context).size.width
  ///
  double get width => sizeX.width;

  /// Returns same as MediaQuery.of(context).height
  ///
  double get height => sizeX.height;

  /// Requests the primary focus for this node, or for a supplied [node], which
  /// will also give focus to its [ancestors].
  ///
  void setFocus({FocusNode? focusNode}) {
    FocusScope.of(this).requestFocus(focusNode ?? FocusNode());
  }
}
