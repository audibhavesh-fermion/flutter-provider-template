import 'package:flutter/material.dart';

class UIWidgetStyle {
  static ButtonStyle buttonStyle

      (Color backgroundColor, Size? size, double? radius,
      {Color? foregroundColor}) =>
      ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0.0))),
          minimumSize: MaterialStateProperty.all(size ?? const Size(50, 50)),
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor));

  static ButtonStyle textButtonStyle(Color backgroundColor,
      Color? foregroundColor, Size? size, double? radius) =>
      TextButton.styleFrom(
          foregroundColor: foregroundColor,
          minimumSize: size ?? const Size(50, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 0.0))),
          backgroundColor: backgroundColor);
}
