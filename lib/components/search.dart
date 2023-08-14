import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

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