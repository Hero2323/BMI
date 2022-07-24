import 'package:flutter/material.dart';

class Sizing {
  static var width;
  static var height;
  static var blockSize;
  static var blockSizeVertical;
  static var fontSize;

  // default scaling values

  static const _defaultWidth = 410;
  //static const _defaultHeight = 730;

  static void setFontSize() {
    final difference =
        width > _defaultWidth ? width - _defaultWidth : _defaultWidth - width;
    fontSize = _defaultWidth / 100 + difference / 1000;
  }

  static void setDimensions(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    blockSize = width / 100;
    blockSizeVertical = height / 100;
    setFontSize();
  }
}
