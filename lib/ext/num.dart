import 'package:flutter/material.dart';

extension SizedBoxExtention on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );

  /// Returns tenth of the number
  ///
  num get tenth => this / 10;

  /// Returns fourth of the number
  ///
  num get fourth => this / 4;

  /// Returns third of the number
  ///
  num get third => this / 3;

  /// Returns half of the number
  ///
  num get half => this / 2;

  /// Return this number time two
  ///
  num get doubled => this * 2;

  /// Return this number time three
  ///
  num get tripled => this * 3;

  /// Convert this integer into boolean.
  ///
  /// Returns `true` if this integer is greater than *0*.
  bool get asBool => this > 0;

  /// returns null if 0
  ///
  num? get asNullIfZero => this == 0 ? null : this;

  /// Returns true if this is null or 0
  ///
  bool get isNullOrZero => asNullIfZero == null;

  Duration toMilliseconds() => Duration(milliseconds: round());

  Duration toSeconds() => Duration(seconds: round());

  Duration toMinutes() => Duration(minutes: round());

  Duration toHours() => Duration(hours: round());

  Duration toDays() => Duration(days: round());
}
