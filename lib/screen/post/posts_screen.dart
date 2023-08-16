import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:line_up_front_end/config/colors.dart';
import 'package:line_up_front_end/components/gradient_widget.dart';
import 'package:line_up_front_end/components/tags.dart';
import 'package:line_up_front_end/models/post.dart';

import '../../config/custom_font_weight.dart';

final posts = [
  Post(
    title: '대잠동 백화점 줄서기',
    body: '포스트 내용',
    cost: '200,000',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
  ),
  Post(
    title: '대잠동 백화점 줄서기',
    body: '포스트 내용',
    cost: '200,000',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
  ),
  Post(
    title: '대잠동 백화점 줄서기',
    body: '포스트 내용',
    cost: '200,000',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
  ),
  Post(
    title: '대잠동 백화점 줄서기',
    body: '포스트 내용',
    cost: '200,000',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
  ),
  Post(
    title: '대잠동 백화점 줄서기',
    body: '포스트 내용',
    cost: '200,000',
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
  ),
];

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [

            const Spacer(),
            const Text('급줄',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryTextColor,
                )),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(SFSymbols.search)),
          ],
        ),
        backgroundColor: AppColors.primaryBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [filterBar(), postList(context)],
          ),
        ),
      ),
    );
  }

  Widget postList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      // margin: const EdgeInsets.only(bottom: ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${posts.length}건',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print('전체 버튼 클릭');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        '전체',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        SFSymbols.chevron_down,
                        size: 16,
                        color: AppColors.secondaryTextColor,
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
          const Divider(color: AppColors.secondaryBackgroundColor, thickness: 2),
          for (var post in posts) ...[
            Container(
              width: 338,
              height: 92,
              margin: const EdgeInsets.only(bottom: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: CustomFontWeight.H,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '일급 ${post.cost}원',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: CustomFontWeight.B,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          post.startDate.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: CustomFontWeight.M,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star_border_outlined,
                    color: AppColors.primaryTextColor,
                    size: 21,
                  ),
                  const SizedBox(width: 6),
                  Container(
                      width: 92,
                      height: 92,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryBackgroundColor,
                      ))
                ],
              ),
            ),
            // Divider(color: AppColors.secondaryBackgroundColor, thickness: 2),
          ],
        ],
      ),
    );
  }

  Widget filterBar() {
    return Column(
      children: [
        Container(
          color: const Color(0xff1B212B),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TagRadioGroup(
              labels: ["날짜별", "하루", "1주일 이내", "1주~1달"],
              onChanged: (String selectedLabel) {
                print("Selected: $selectedLabel");
              },
            ),
          ),
        ),
        const SizedBox(height: 7),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 26),
              const Text(
                '날짜',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(width: 28),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryTextColor,
                    side:
                        const BorderSide(color: Color(0xFF212732), width: 0.5),
                    // 선 색상, 두께 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '2023.07.12 ~ 2023.07.12',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        Spacer(),
                        Icon(SFSymbols.calendar),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 21),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child:
              Divider(color: AppColors.secondaryBackgroundColor, thickness: 2),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Tag(tag: '포항시 남구 전체 X', isSelected: true),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('filter button pressed');
                  }
                },
                icon: const GradientWidget(
                  child: Icon(SFSymbols.slider_horizontal_3,
                      color: Colors.white, size: 24),
                ),
              ),
            ],
          ),
        ),

        // Tag(tag: 'tag',),
        const Divider(
          color: AppColors.secondaryBackgroundColor,
          thickness: 8,
        )
      ],
    );
  }
}
