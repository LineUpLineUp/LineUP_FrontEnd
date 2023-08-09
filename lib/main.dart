import 'package:flutter/material.dart';
import 'package:line_up_front_end/screen/const/app_theme.dart';
import 'package:line_up_front_end/screen/home_screen.dart';
import 'package:line_up_front_end/screen/onboard_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: appTheme,
        home: HomeScreen(), // 온보딩 화면을 시작 화면으로 설정
        routes: {
          // '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        },
    ),
  );
}
