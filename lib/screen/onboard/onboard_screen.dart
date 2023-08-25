import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_up_front_end/components/buttons.dart';
import 'package:line_up_front_end/config/colors.dart';
import 'package:line_up_front_end/config/custom_font_weight.dart';
import 'package:line_up_front_end/screen/onboard/onboard_page.dart';
import 'package:line_up_front_end/screen/root_screen.dart';
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
                padding: const EdgeInsets.only(top: 11, right: 40),
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
          padding: EdgeInsets.only(top: 50, left: 40),
          child: Text(
            '줄서기 공고가\n많은 카테고리',
            style: TextStyle(
              fontSize: 36,
              fontWeight: CustomFontWeight.B,
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
              fontWeight: CustomFontWeight.L,
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
    return  Align(
      alignment: Alignment.topRight,
      child:  Padding(
        padding: const EdgeInsets.only(top: 140),
        child: Image.asset(
          'assets/images/onboard/onboarding_background_1.png',
          height: 404,
        ),
      ),
    );
  }
}

class OnBoardingPageSecond extends OnboardingPage {
  const OnBoardingPageSecond({super.key});

  @override
  Widget background() {
    return  Align(
      alignment: Alignment.topRight,
      child:  Padding(
        padding: const EdgeInsets.only(top: 140),
        child: Image.asset(
          'assets/images/onboard/onboarding_background_2.png',
          height: 596.6,
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
          padding: EdgeInsets.only(top: 50),
          child: Text(
            '신뢰감 있는 PASS',
            style: TextStyle(
              fontSize: 36,
              fontWeight: CustomFontWeight.B,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            '검증절차',
            style: TextStyle(
              fontSize: 36,
              fontWeight: CustomFontWeight.B,
              color: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            '라인업은 pass를 인증한 성인분들만 이용할 수 있어요.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.L,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '오픈런 알바,',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: CustomFontWeight.B,
                  color: Colors.white,
                ),
              ),
              const Text(
                '줄서기 대행은 지금',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: CustomFontWeight.B,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                'assets/images/onboard/onboarding_logo.svg',
                height: 32,
              ),
              Spacer(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const Text(
                          '계속하려면 로그인 하세요',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: CustomFontWeight.M,
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
                            fontWeight: CustomFontWeight.M,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 42,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
            Navigator.pushReplacementNamed(context, "home");
          },
        ),
        const SizedBox(
          width: 16,
        ),
        // Naver login
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/sns/naver.svg',
            height: 54,
          ),
          onTap: () async {
            NaverLoginResult _result = await FlutterNaverLogin.logIn();
            print(_result);
            Navigator.pushReplacementNamed(context, "home");
          },
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          child: SvgPicture.asset(
            'assets/icons/sns/apple.svg',
            height: 54,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, "home");
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
            Navigator.pushReplacementNamed(context, "home");
          },
        ),
      ],
    );
  }

  @override
  Widget background() {
    return  Align(
      alignment: Alignment.topRight,
      child:  Padding(
        padding: const EdgeInsets.only(top: 140),
        child: Image.asset(
          'assets/images/onboard/onboarding_background_3.png',
          height: 461,
        ),
      ),
    );
  }
}


