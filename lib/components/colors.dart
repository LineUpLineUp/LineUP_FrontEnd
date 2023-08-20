// colors.dart
import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // 이 클래스는 인스턴스화되지 않도록 합니다.
  static const primaryColor = Colors.blue;
  static const accentColor = Color(0xFF2CE3A7);
  static const primaryButtonColor = Color(0xFFAFAFAF);
  static const primaryBlurColor = Color(0x332CE3A7);
  static const primaryTextColor = Colors.white;
  static const secondaryTextColor = Color(0xFFAFAFAF);
  static const primaryBackgroundColor = Color(0xFF12171F);
  static const secondaryBackgroundColor = Color(0xFF212732);
  static const floatingButtonColor = Color(0xFF2CE3A7);
  static const floatingListColor = Color(0xFF2F3237);
  static const postFormButtonColor = Color(0xffD9D9D9);
  static const primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF1280F4),
      Color(0xFF2CE3F4),
      Color(0xFF2CE3A7),
    ],
    stops: [
      0.0,
      0.49339,
      0.903029,
    ],
  );
  static const secondaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF1280F4),
      Color(0xFF2CE3F4),
      Color(0xFF2CE3A7),
    ],
    stops: [
      1,
      0.49339,
      0.903029,
    ],
  );


// Add more colors as needed
}
