import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_up_front_end/components/buttons.dart';
import 'package:line_up_front_end/components/colors.dart';
import 'package:line_up_front_end/screen/home_screen.dart';
import 'package:line_up_front_end/screen/onboard/onboard_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final controller = PageController(viewportFraction: 1, keepPage: true);

class OnboardingScreen extends StatelessWidget {
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
                  const OnBoardingPageFirst(),
                  const OnBoardingPageSecond(),
                  LoginPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingPageFirst extends OnboardingPage {
  const OnBoardingPageFirst({super.key});

  @override
  Widget content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 52, left: 40),
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
          padding: EdgeInsets.only(top: 10, left: 40),
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
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 49, 15, 0),
          child: PrimaryButton(
            text: '다음',
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget background() {
    throw UnimplementedError();
  }

}

class OnBoardingPageSecond extends OnboardingPage {
  const OnBoardingPageSecond({super.key});

  @override
  Widget background() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor,
          ],
        ),
      ),
    );
  }

  @override
  Widget content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 52),
          child: Text(
            '신뢰감 있는 PASS\n검증절차',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 40),
          child: Text(
            '라인업은 pass를 인증한 성인분들만 이용할 수 있어요.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 42),
          child: SvgPicture.asset(
            'assets/images/onboard/onboarding_pass.svg',
            height: 127,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17),
          child: SvgPicture.asset(
            'assets/images/mascot/raon2.svg',
            height: 234,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 49, 15, 0),
          child: PrimaryButton(
            text: '다음',
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        ),
      ],
    );
  }
}

class LoginPage extends OnboardingPage {

  @override
  Widget content(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 52),
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '오픈런 알바,',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '줄서기 대행은 지금',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SvgPicture.asset(
                    'assets/images/onboard/onboarding_logo.svg',
                    height: 32,
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 357),
                          child: Column(
                            children: [
                              const Text(
                                '계속하려면 로그인 하세요',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              snsLogin(context),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                '로그인 시 이용 약관 및 개인정보 보호정책에 동의합니다.',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget snsLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/sns/kakao.svg',
            height: 54,
          ),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          child:SvgPicture.asset(
            'assets/icons/sns/naver.svg',
            height: 54,
          ),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          child:SvgPicture.asset(
            'assets/icons/sns/apple.svg',
            height: 54,
          ),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/sns/google.svg',
            height: 54,
          ),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
      ],
    );
  }

  @override
  Widget background() {
    throw UnimplementedError();
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
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
