import 'package:flutter/material.dart';

class UIConstant {
  BuildContext context;

  UIConstant({required this.context});

  MediaQueryData get getMediaQueryData => MediaQuery.of(context);

  Size get getSize => getMediaQueryData.size;

  double get getScreenWidth => getSize.width;

  double get getScreenHeight => getSize.height;

  double get getScreenHalfWidth => getSize.width / 2;

  double get getScreenHalfHeight => getSize.height / 2;

  EdgeInsets get getScreenPadding => getMediaQueryData.padding;
}
