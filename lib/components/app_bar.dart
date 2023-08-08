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
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 26,
            ),
            const SizedBox(width: 12.0),
            // SearchWidget(),
            Expanded(
              // Expanded를 사용하여 TextField가 남은 공간을 차지하도록 설정
              child: Container(
                height: 36,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 9, bottom: 9),
                decoration: ShapeDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: SearchBar(),
              ),
            ),
            const SizedBox(width: 12.0),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/bell.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.primaryBackgroundColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(),

      child: TextField(
        controller: _searchController,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        onChanged: (value) {
          // 검색어 변경 시 동작을 수행
          print('검색어: $value');
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          hintText: '어떤 줄서기를 하고 싶은가요?',
          hintStyle: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 12,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              //TODO: 검색 버튼 클릭시 이벤트
            },
            padding: EdgeInsets.only(bottom: 9),
          ),
        ),
      ),
    );
  }
}