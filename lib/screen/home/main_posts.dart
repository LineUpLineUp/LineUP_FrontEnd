import 'package:flutter/material.dart';

import '../../components/colors.dart';
import '../../models/post.dart';

class MainPosts extends StatelessWidget {
  final posts = [
    Post(
        title: '대잠동 백화점 줄서기',
        body: '포스트 내용',
        cost: '200,000',
        startDate: DateTime.now(),
        endDate: DateTime.now()),
    Post(
        title: '대잠동 백화점 줄서기',
        body: '포스트 내용',
        cost: '200,000',
        startDate: DateTime.now(),
        endDate: DateTime.now()),
    Post(
        title: '대잠동 백화점 줄서기',
        body: '포스트 내용',
        cost: '200,000',
        startDate: DateTime.now(),
        endDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: <Widget>[
            for (var post in posts) ...[
              Container(
                width: 338,
                height: 92,
                margin: const EdgeInsets.symmetric(vertical: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '일급 ' + post.cost + '원',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            post.startDate.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star_border_outlined,
                      color: AppColors.primaryTextColor,
                      size: 21,
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackgroundColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ],
        )
      ],
    );
  }
}
