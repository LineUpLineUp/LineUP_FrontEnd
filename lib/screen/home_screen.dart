import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_up_front_end/components/app_bar.dart';
import 'package:line_up_front_end/components/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageController 생성
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    // TODO: Carousel 설정
    Timer.periodic(Duration(seconds: 3), (timer) {
      // 현재 페이지 가져오기
      int? nextPage = pageController.page?.toInt();

      if (nextPage == null) {
        // 페이지 값이 없을 때 예외처리
        return;
      }

      if (nextPage == 4) {
        nextPage = 0;
      } else {
        nextPage++;
      }
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: PageView(
                controller: pageController,
                children: [1, 2, 3, 4, 5]
                    .map(
                      (number) => Image.asset(
                        'assets/images/carousel/image_$number.jpeg',
                        fit: BoxFit.fill,
                      ),
                    )
                    .toList()),
          ),
          const SizedBox(width: 16),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButtonWithText(
                  iconPath: 'assets/icons/맞춤.png',
                  text: '맞춤',
                  onPressed: () {
                    print('맞춤 버튼 클릭!');
                  },
                ),
                IconButtonWithText(
                  iconPath: 'assets/icons/급줄.png',
                  text: '급줄',
                  onPressed: () {
                    print('급줄 버튼 클릭!');
                  },
                ),
                IconButtonWithText(
                  iconPath: 'assets/icons/백화점.png',
                  text: '백화점',
                  onPressed: () {
                    print('백화점 버튼 클릭!');
                  },
                ),
                IconButtonWithText(
                  iconPath: 'assets/icons/음식점.png',
                  text: '음식점',
                  onPressed: () {
                    print('음식점 버튼 클릭!');
                  },
                ),
                IconButtonWithText(
                  iconPath: 'assets/icons/팝업스토어.png',
                  text: '팝업스토어',
                  onPressed: () {
                    print('팝업스토어 버튼 클릭!');
                  },
                ),
                IconButtonWithText(
                  iconPath: 'assets/icons/카페.png',
                  text: '카페',
                  onPressed: () {
                    print('카페 버튼 클릭!');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconButtonWithText extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  IconButtonWithText(
      {
        required this.iconPath,
        required this.text,
        required this.onPressed
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Image.asset(iconPath),
          onPressed: onPressed,
        ),
        // SizedBox(height: 5), // 버튼과 텍스트 사이에 간격 추가
        Text(text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12
          ),
        ),
      ],
    );
  }
}
