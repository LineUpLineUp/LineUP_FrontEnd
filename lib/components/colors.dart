// colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Colors.blue;
  static const accentColor = Color(0xFF2CE3A7);

  static const primaryBlurColor = Color(0x332CE3A7);
  static const primaryTextColor = Colors.white;
  static const secondaryTextColor = Color(0xFFAFAFAF);
  static const primaryBackgroundColor = Color(0xFF12171F);
  static const secondaryBackgroundColor = Color(0xFF212732);
  static const floatingButtonColor = Color(0xFF2CE3A7);
  static const floatingListColor = Color(0xFF2F3237);
  // <linearGradient id="paint0_linear_213_33215" x1="-3.82955" y1="10.7073" x2="23.483" y2="10.7073" gradientUnits="userSpaceOnUse">
  // <stop stop-color="#1280F4"/>
  // <stop offset="0.49339" stop-color="#2CE3F4"/>
  // <stop offset="0.903029" stop-color="#2CE3A7"/>
  // </linearGradient>
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
  // <linearGradient id="paint0_linear_488_700" x1="-14.3636" y1="8.21951" x2="185.136" y2="8.21951" gradientUnits="userSpaceOnUse">
  // <stop stop-color="#1280F4"/>
  // <stop offset="0.49339" stop-color="#2CE3F4"/>
  // <stop offset="0.903029" stop-color="#2CE3A7"/>
  // </linearGradient>
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
