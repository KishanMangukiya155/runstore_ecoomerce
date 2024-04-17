import 'package:runstore_ecoomerce/libraries.dart';

class AppSizes {
  AppSizes._();

  static late double height;
  static late double width;

  static onInit(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  // Use this size for appbar height
  static final double appBarPreferredSize = height * 0.1;

  // Paddings for Horizontal
  static final double minorHorizontalPadding = width * 0.024;
  static final double defaultHorizontalPadding = width * 0.036;
  static final double extraHorizontalPadding = width * 0.050;
  // Paddings for Vertical
  static final double minorVerticalPadding = width * 0.024;
  static final double defaultVerticalPadding = width * 0.036;
  static final double extraVerticalPadding = width * 0.048;

  // Spacing Height
  static final double defaultHeight = height * 0.024;
  static final double extraDefaultHeight = height * 0.036;
  // Spacing Width
  static final double defaultWidth = width * 0.012;
  static final double extraDefaultWidth = width * 0.024;

  // Spacing and height for forms
  static final double formVerticalSpace = height * 0.020;
  static final double formHorizontalSpace = width * 0.010;
  static final double formIconHeight = height * 0.035;
}
