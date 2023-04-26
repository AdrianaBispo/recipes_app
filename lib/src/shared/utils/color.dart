import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;

  AppColor._();
  
  static AppColor get instance {
    _instance ??= AppColor._();
    return _instance!;
  }

  Color get primaria => const Color(0xFFFFC439);
  Color get secundaria => const Color(0xffFFFFFF);
  Color get black => const Color(0xFF000000);
  Color get unselected => const Color(0xFFE4E4E4);
}
