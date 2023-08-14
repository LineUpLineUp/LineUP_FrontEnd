import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.only(bottom: 5),
        // height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: 26,
            width: 84,
        ),
        const SizedBox(width: 17.0),
        // SearchWidget(),
        Expanded(
          // Expanded를 사용하여 TextField가 남은 공간을 차지하도록 설정
          child: Container(
            height: 36,
            width: 197,
            // padding: const EdgeInsets.only(
            //     left: 17, right: 17),
            // decoration: ShapeDecoration(
            //   // color: AppColors.secondaryBackgroundColor,
            //   // color: Colors.black,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            // ),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                print('검색 버튼 클릭!');
                // TODO: 검색 페이지로 이동
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => ), // 다른 페이지의 위젯
              },
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 197,
                height: 36,
              ),
            ),

          ),
        ),
      // ),
      const SizedBox(width: 17.0),
      Container(
        child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/bell.svg',
            width: 24,
            height: 25,
          ),
        ),
      ),
      ],
    ),
    ),
    backgroundColor: AppColors.primaryBackgroundColor,
    elevation: 0
    ,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
