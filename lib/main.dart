import 'package:flutter/material.dart';


import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:line_up_front_end/views/login/login_screen.dart';
import 'package:line_up_front_end/views/onboard/onboard_screen.dart';
import 'package:line_up_front_end/views/post/posts_screen.dart';
import 'package:line_up_front_end/views/root_screen.dart';

import 'constants/app_theme.dart';

void main() async{

  // 플러터 프레임워크가 준비될 때까지 대기
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await initializeDateFormatting(); //intl 패키지 초기화(다국어화)

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