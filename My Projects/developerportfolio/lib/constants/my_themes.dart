import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static TextStyle textTheme14({FontWeight? fontWeight, Color? color}) => TextStyle(
    color: color,
    fontFamily: 'Proxima Nova Alt',
    fontSize: 14,
    fontWeight: fontWeight ?? FontWeight.bold,
  ); 

  static TextStyle textTheme16({FontWeight? fontWeight, Color? color}) => TextStyle(
    color: color,
    fontFamily: 'Proxima Nova Alt',
    fontSize: 16,
    fontWeight: fontWeight ?? FontWeight.bold,
  ); 
}

class MyColors {
  static Color primary = Colors.white12;
  static Color onPrimary = Colors.white70;
}

class ContainerTheme {
  static const padding8 = EdgeInsets.all(8);
  static const padding10 = EdgeInsets.all(10);
  static const padding12 = EdgeInsets.all(12);

  static const paddingVHSmall = EdgeInsets.symmetric(vertical: 4, horizontal: 8);
  static const paddingVHMedium = EdgeInsets.symmetric(vertical: 6, horizontal: 12);
  static const paddingVHRegular = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  static const paddingVSmall = EdgeInsets.symmetric(vertical: 8);
  static const paddingVMedium = EdgeInsets.symmetric(vertical: 12);
  static const paddingVRegular = EdgeInsets.symmetric(vertical: 16);

  static const paddingHSmall = EdgeInsets.symmetric(horizontal: 8);
  static const paddingHMedium = EdgeInsets.symmetric(horizontal: 12);
  static const paddingHRegular = EdgeInsets.symmetric(horizontal: 16);
  
  static Border bottomBorder({
    Color? color,
    double? width,
  }) => Border(
    bottom: BorderSide(
      width: width ?? 1,
      color: color ?? MyColors.primary
    )
  );
}

abstract class HorizontalSpacers {
  static const small = SizedBox(width: 12);

  /// returns a sizedbox with predefined width [value]
  static fromSize(double value) => SizedBox(width: value);
}

abstract class VerticalSpacers {
  static const small = SizedBox(height: 12);

  /// returns a sizedbox with predefined height
  static SizedBox fromSize(double value) => SizedBox(height: value);
}
