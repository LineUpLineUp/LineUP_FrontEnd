
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';

import '../../components/colors.dart';

class locationSearch extends StatefulWidget {
  const locationSearch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _locationSearch();

}

class _locationSearch extends State<locationSearch>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        title: Text(
          "위치 검색",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: CustomFontWeight.B,
            color: Color(0xffffffff),
            height: 22/16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}