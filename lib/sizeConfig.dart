import 'package:flutter/material.dart';

class SizeConfig {
  static  MediaQueryData? _mediaQueryData;
  static double? screenWidth = _mediaQueryData!.size.width;
  static double screenHeight = _mediaQueryData!.size.height;
  static double? defaultSize;
  static Orientation? orientation = _mediaQueryData!.orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth!;
}
