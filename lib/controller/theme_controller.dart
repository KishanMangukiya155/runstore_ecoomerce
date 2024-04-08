import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> currentThemeMode = ThemeMode.system.obs;

  void setTheme() {
    currentThemeMode(
      currentThemeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
