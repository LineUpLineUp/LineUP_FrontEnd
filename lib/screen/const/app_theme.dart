import 'package:flutter/material.dart';
import 'package:line_up_front_end/components/colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
  fontFamily: 'AppleSDGothicNeo',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      // 여기에 다른 스타일 속성 추가
    ),
  ),
  splashFactory: NoSplash.splashFactory, // 눌렀을 때의 물방울 효과 제거
  highlightColor: Colors.transparent, // 눌렀을 때의 하이라이트 효과 제거,

);