import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/colors.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Padding(padding: EdgeInsets.only(top: 7, left: 10)),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                iconSize: 20,
                color: Colors.grey,
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 11, right: 25),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: AppColors.accentColor,
                    dotHeight: 8,
                    expansionFactor: 4,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                ),
              ),
            ]),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  // 온보딩 페이지들
                  OnboardingPageFirst(),
                  OnboardingPage(title: 'Welcome to Our App!'),
                  OnboardingPage(title: 'Explore Features'),
                  OnboardingPage(title: 'Get Started Now'),
                ],
                onPageChanged: (index) {
                  // if (index == 2) {
                  //   // 마지막 페이지에서 다음 화면으로 이동
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()),
                  //   );
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;

  OnboardingPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class OnboardingPageFirst extends StatelessWidget {
  const OnboardingPageFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 70),
          child: Text(
            '줄서기 공고가\n많은 카테고리',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            '다양한 줄서기 공고 중에서도 가장 인기가 많은\n줄서기 카테고리를 준비했어요.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 32),
            child: Image(
              image:
                  AssetImage('assets/images/onboard/onboarding_categories.png'),
              height: 122,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SvgPicture.asset(
              'assets/images/mascot/raon1.svg',
              height: 234,
            ),
          ),
        )
      ],
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Username'),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // 로그인 로직 처리 후 메인 화면으로 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ArchCards extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        // 아치의 반경을 계산합니다.
        final radius = height * 0.4;

        return Stack(
          children: colors.asMap().entries.map(
            (entry) {
              // 각도를 계산합니다.
              final angle = (pi / (colors.length - 1)) * entry.key;
              final x = width / (colors.length - 1) * entry.key;
              final y = height / 2 -
                  radius * sin(angle) -
                  74 * (1 - sin(angle)); // 카드의 높이를 고려하여 y 위치를 조정합니다.

              return Positioned(
                left: x,
                top: y,
                child: Card(
                  color: entry.value,
                  child: SizedBox(
                    width: 60,
                    height: 74,
                    child: Center(
                      child: Text(
                        'Card ${entry.key + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
