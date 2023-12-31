import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_up_front_end/constants/colors.dart';
import 'package:line_up_front_end/widgets/app_bar.dart';

import 'package:line_up_front_end/constants/custom_font_weight.dart';
import 'package:line_up_front_end/views/post/posts_screen.dart';
import '../post_form.dart';
import 'main_posts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageController 생성
  final PageController pageController = PageController();
  String selectedLocation = '위치 탐색';
  bool _showItemList = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    // TODO: Carousel 설정
    Timer.periodic(const Duration(seconds: 3), (timer) {
      // 현재 페이지 가져오기
      int? nextPage = pageController.page?.toInt();

      if (nextPage == null) {
        // 페이지 값이 없을 때 예외처리
        nextPage = 0;
      }

      if (nextPage == 4) {
        nextPage = 0;
      } else {
        nextPage++;
      }
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: CustomAppBar(),
      body: GestureDetector(
        child: GestureDetector(
          onTap: () {
            if (_showItemList) _toggleItemList();
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 390,
                      height: 215,
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
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButtonWithText(
                            iconPath:
                                'assets/icons/categories/customization.png',
                            text: '맞춤',
                            onPressed: () {
                              print('맞춤 버튼 클릭!');
                              // TODO: 맞춤 페이지로 이동
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => PostsScreen()),
                              // );
                            },
                          ),
                          IconButtonWithText(
                            iconPath: 'assets/icons/categories/fast.png',
                            text: '급줄',
                            onPressed: () {
                              print('급줄 버튼 클릭!');
                              // TODO: 급줄 페이지로 이동
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PostsScreen()),
                              );
                            },
                          ),
                          IconButtonWithText(
                            iconPath:
                                'assets/icons/categories/department_store.png',
                            text: '백화점',
                            onPressed: () {
                              print('백화점 버튼 클릭!');
                              // TODO: 백화점 페이지로 이동
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => ), // 다른 페이지의 위젯
                            },
                          ),
                          IconButtonWithText(
                            iconPath: 'assets/icons/categories/restaurant.png',
                            text: '음식점',
                            onPressed: () {
                              print('음식점 버튼 클릭!');
                              // TODO: 음식점 페이지로 이동
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => ), // 다른 페이지의 위젯
                            },
                          ),
                          IconButtonWithText(
                            iconPath:
                                'assets/icons/categories/pop_up_store.png',
                            text: '팝업스토어',
                            onPressed: () {
                              print('팝업스토어 버튼 클릭!');
                              // TODO: 팝업스토어 페이지로 이동
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => ), // 다른 페이지의 위젯
                            },
                          ),
                          IconButtonWithText(
                            iconPath: 'assets/icons/categories/cafe.png',
                            text: '카페',
                            onPressed: () {
                              print('카페 버튼 클릭!');
                              // TODO: 카페 페이지로 이동
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => ), // 다른 페이지의 위젯
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 33),
                    GestureDetector(
                      onTap: () {
                        // TODO: 위치 검색 페이지로 이동
                        print('위치 검색 이동');
                        // TODO: 위치 검색 페이지로 이동
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => ), // 다른 페이지의 위젯
                      },
                      child: Container(
                        width: 338,
                        height: 47,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 27),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location/location_square.svg',
                              ),
                              const SizedBox(width: 14),
                              Text(
                                '$selectedLocation',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 179),
                              SvgPicture.asset(
                                'assets/icons/location/location_backward.svg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    SvgPicture.asset(
                      'assets/icons/drawLine.svg',
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {
                        // TODO: 공지사항 검색 페이지로 이동
                        print('공지사항 이동');
                        // 다른 페이지로 이동
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => ), // 다른 페이지의 위젯
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 29, right: 35),
                        child: Container(
                          width: 326,
                          height: 22,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/main_announcement.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 26, right: 132),
                      child: Container(
                        width: 232,
                        height: 43,
                        child: SvgPicture.asset(
                          'assets/icons/main_text.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SvgPicture.asset(
                      'assets/icons/drawLine.svg',
                    ),

                    // TODO: 공고 넣을 장소
                    MainPosts(),

                    // const SizedBox(height: 356),
                    SvgPicture.asset(
                      'assets/icons/drawLine.svg',
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 29, right: 129),
                      child: Container(
                        width: 232,
                        height: 62,
                        child: SvgPicture.asset(
                          'assets/icons/main_footer_text.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_showItemList) _buildItemList(),
            ],
          ),
        ),
      ),
      // TODO: 모달 기능 추가 필요
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 27),
        // right: 29,
        // bottom: 109,
        child: FloatingActionButton(
          onPressed: () {
            _toggleItemList();
          },
          backgroundColor: const Color(0x2CE3A7),
          tooltip: 'Show/Hide Item List',
          child: _showItemList
              ? SvgPicture.asset(
                  'assets/icons/floating_buttonX.svg',
                  width: 44,
                  height: 44,
                )
              : SvgPicture.asset(
                  'assets/icons/floating_button.svg',
                  width: 44,
                  height: 44,
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _toggleItemList() {
    setState(() {
      _showItemList = !_showItemList;
      _isExpanded = !_isExpanded;
    });
  }

  Widget _buildItemList() {
    return Positioned(
      // padding: EdgeInsets.only(bottom: 50, right: 29),
      bottom: 110,
      right: 29.0,
      child: Column(
        children: [
          Visibility(
            visible: _isExpanded,
            child: Column(
              children: [
                Container(
                  width: 177,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.floatingListColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostForm(
                                  initialText: '급줄',
                                  imagePath: 'assets/icons/categories/fast.png',
                                )),
                      ); // 다른 페이지의 위젯
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: AppColors.secondaryBackgroundColor,
                          child: Image.asset(
                            'assets/icons/categories/fast.png',
                          ),
                        ),
                        const SizedBox(width: 9),
                        const Text(
                          '급줄',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: CustomFontWeight.M,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 177,
                  height: 192,
                  decoration: BoxDecoration(
                    color: AppColors.floatingListColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PostForm(
                                      initialText: '백화점',
                                      imagePath:
                                          'assets/icons/categories/department_store.png',
                                    )),
                          ); // 다른 페이지의 위젯
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/department_store.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '백화점',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PostForm(
                                      initialText: '음식점',
                                      imagePath:
                                          'assets/icons/categories/restaurant.png',
                                    )),
                          ); // 다른 페이지의 위젯
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/restaurant.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '음식점',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PostForm(
                                      initialText: '팝업스토어',
                                      imagePath:
                                          'assets/icons/categories/pop_up_store.png',
                                    )),
                          ); // 다른 페이지의 위젯
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/pop_up_store.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '팝업스토어',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PostForm(
                                      initialText: '카페',
                                      imagePath:
                                          'assets/icons/categories/cafe.png',
                                    )),
                          ); // 다른 페이지의 위젯
                        },
                        child: Row(
                          children: [
                            // const SizedBox(width: 16),
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/cafe.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '카페',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
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
        ],
      ),
    );
  }
}

// 카테고리 아이콘을 위한 아이콘 버튼
class IconButtonWithText extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  IconButtonWithText({
    required this.iconPath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Image.asset(iconPath),
          onPressed: onPressed,
          iconSize: 46,
        ),
        const SizedBox(height: 6), // 버튼과 텍스트 사이에 간격 추가
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
