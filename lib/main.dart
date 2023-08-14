import 'package:flutter/material.dart';
import 'package:line_up_front_end/screen/const/app_theme.dart';
import 'package:line_up_front_end/screen/home_screen.dart';
import 'package:line_up_front_end/screen/onboard/onboard_screen.dart';
import 'package:line_up_front_end/screen/post/posts_screen.dart';
import 'package:line_up_front_end/screen/root_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
        home: OnboardingScreen(), // 온보딩 화면을 시작 화면으로 설정
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => RootScreen(),
          '/posts': (context) => PostsScreen(),
        },
    ),
  );
}