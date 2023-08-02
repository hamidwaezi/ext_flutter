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
  bool get isLandscape => deviceOrientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  ///
  Size get sizeX => MediaQuery.sizeOf(this);

  /// Returns same as MediaQuery.of(context).size.width
  ///
  double get width => sizeX.width;

  /// Returns same as MediaQuery.of(context).height
  ///
  double get height => sizeX.height;

  ///With this extension, you can access the device pixel ratio using [context.devicePixelRatio] and the text scaling factor using [context.textScaleFactor].
  ///These additional extensions demonstrate more ways to extend the functionality of the BuildContext class in Flutter. Remember, you can create extensions based on your specific requirements and customize them to suit your app's needs.
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  ///With this extension, you can access the device pixel ratio using [context.devicePixelRatio] and the text scaling factor using [context.textScaleFactor].
  ///These additional extensions demonstrate more ways to extend the functionality of the BuildContext class in Flutter. Remember, you can create extensions based on your specific requirements and customize them to suit your app's needs.
  double get textScaleFactor => MediaQuery.textScaleFactorOf(this);

  ///Device Orientation Extensions: These extensions provide information about the device orientation. You can add an extension method to the BuildContext class to check the current orientation
  Orientation get deviceOrientation => MediaQuery.orientationOf(this);

  /// Requests the primary focus for this node, or for a supplied [node], which
  /// will also give focus to its [ancestors].
  ///
  void setFocus({FocusNode? focusNode}) {
    FocusScope.of(this).requestFocus(focusNode ?? FocusNode());
  }

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  TabController? get defaultTabController => DefaultTabController.maybeOf(this);
  NavigatorState navigator([bool rootNavigator = false]) =>
      Navigator.of(this, rootNavigator: rootNavigator);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
          SnackBar message) =>
      ScaffoldMessenger.of(this).showSnackBar(message);
  TargetPlatform get platform => Theme.of(this).platform;

  FormState? get formState => Form.maybeOf(this);
  bool? get isFormValid => formState?.validate();
  void saveForm() => formState?.save();
  void resetForm() => formState?.reset();

  // String localize(String key) {
  //   return AppLocalizations.of(this)!.translate(key);
  // }
}
