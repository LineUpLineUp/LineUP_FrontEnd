import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_up_front_end/components/colors.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';

import 'myDropDown.dart';

class longTime extends StatefulWidget {
  const longTime({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _longTime();
}

class _longTime extends State<longTime> {
  // 라인업 날짜
  List<String> selectedDays = [];

  // 라인업 시간
  String selectedStartTime = "09:00";
  String selectedEndTime = "18:00";

  bool _showStartTimeList = false;
  bool _showEndTimeList = false;

  bool _isStartExpanded = false;
  bool _isEndExpanded = false;
  ScrollController _scrollController = ScrollController();

  // 라인업 비용
  String costSelectedValue = "시급";
  bool _showCostList = false;
  bool _isCostExpanded = false;


  void toggleDay(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < 0.0) {
        _scrollController.jumpTo(0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (_showStartTimeList) _toggleStartTimeList();
        if (_showEndTimeList) _toggleEndTimeList();
        if (_showCostList) _toggleCostList();
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                "라인업 날짜",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: CustomFontWeight.M,
                  color: Color(0xffffffff),
                  height: 18 / 14,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var day in ['월', '화', '수', '목', '금', '토', '일'])
                    InkWell(
                      onTap: () => toggleDay(day),
                      child: Container(
                        width: 38,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedDays.contains(day)
                              ? AppColors.postFormButtonColor // 선택된 경우의 색상
                              : AppColors
                                  .secondaryBackgroundColor, // 선택되지 않은 경우의 색상
                        ),
                        child: Text(
                          day,
                          style: selectedDays.contains(day)
                              ? const TextStyle(
                                  fontSize: 14,
                                  fontWeight: CustomFontWeight.M,
                                  color: Color(0xff000000),
                                  height: 18 / 14,
                                )
                              : const TextStyle(
                                  fontSize: 14,
                                  fontWeight: CustomFontWeight.M,
                                  color: AppColors.primaryButtonColor,
                                  height: 18 / 14,
                                ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                "라인업 시간",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: CustomFontWeight.M,
                  color: Color(0xffffffff),
                  height: 18 / 14,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "시작",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: CustomFontWeight.L,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(width: 175),
                  Text(
                    "종료",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: CustomFontWeight.L,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      _toggleStartTimeList();
                    },
                    child: Container(
                      width: 153,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.secondaryTextColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 18),
                          Text(
                            selectedStartTime,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: CustomFontWeight.M,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 66),
                          Image.asset(
                            'assets/icons/postForm/arrow_down.png',
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "~",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: CustomFontWeight.M,
                      color: Color(0xffffffff),
                      height: 26 / 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      _toggleEndTimeList();
                    },
                    child: Container(
                      width: 153,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.secondaryTextColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 18),
                          Text(
                            selectedEndTime,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: CustomFontWeight.M,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 66),
                          Image.asset(
                            'assets/icons/postForm/arrow_down.png',
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                "라인업 비용",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: CustomFontWeight.M,
                  color: Color(0xffffffff),
                  height: 18 / 14,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _toggleCostList();
                    },
                    child: Container(
                      width: 153,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.secondaryTextColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 18),
                          Text(
                            costSelectedValue,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: CustomFontWeight.M,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 80),
                          Image.asset(
                            'assets/icons/postForm/arrow_down.png',
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 175,
                    height: 44,
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: CustomFontWeight.M,
                        color: Color(0xffffffff),
                        height: 18 / 14,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]')), // 숫자만 허용
                      ],
                      onTap: () {},
                      decoration: InputDecoration(
                        hintText: "9,620",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: CustomFontWeight.M,
                          color: Color(0xffb0afaf),
                          height: 18 / 14,
                        ),
                        suffixText: '원',
                        suffixStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: CustomFontWeight.M,
                          color: Color(0xffffffff),
                          height: 18 / 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    // color: AppColors.primaryButtonColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 26),
                width: 338,
                height: 93,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "최저임금을 꼭 지켜주세요!",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: CustomFontWeight.B,
                        color: Color(0xffffffff),
                        height: 20 / 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        print('좋아용 클릭');
                      },
                      child: Image.asset(
                        'assets/icons/postForm/good.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_showStartTimeList) startTimeCheck(),
          if (_showEndTimeList) endTimeCheck(),
          if (_showCostList) costMenu(),
        ],
      ),

    );
  }

  void _toggleStartTimeList() {
    setState(() {
      _showStartTimeList = !_showStartTimeList;
      _isStartExpanded = !_isStartExpanded;
    });
  }

  void _toggleEndTimeList() {
    setState(() {
      _showEndTimeList = !_showEndTimeList;
      _isEndExpanded = !_isEndExpanded;
    });
  }

  void _toggleCostList() {
    setState(() {
      _showCostList = !_showCostList;
      _isCostExpanded = !_isCostExpanded;
    });
  }

  Widget startTimeCheck() {
    final List<String> timeList = List.generate(144, (index) {
      int hour = (index * 10) ~/ 60;
      int minute = (index * 10) % 60;
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    });

    return Positioned(
      bottom: 100,
      child: Column(
        children: [
          Visibility(
            visible: true,
            child: Container(
              width: 153,
              height: 332,
              decoration: BoxDecoration(
                color: AppColors.drawerColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: timeList.map((time) {
                    return TextButton(
                      onPressed: () {
                        selectedStartTime = time;
                        _toggleStartTimeList();
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 18),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: CustomFontWeight.M,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget endTimeCheck() {
    final List<String> timeList = List.generate(144, (index) {
      int hour = (index * 10) ~/ 60;
      int minute = (index * 10) % 60;
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    });

    return Positioned(
      right: 4,
      bottom: 100,
      child: Column(
        children: [
          Visibility(
            visible: true,
            child: Container(
              width: 153,
              height: 332,
              decoration: BoxDecoration(
                color: AppColors.drawerColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: timeList.map((time) {
                    return TextButton(
                      onPressed: () {
                        selectedEndTime = time;
                        _toggleEndTimeList();
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 18),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: CustomFontWeight.M,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget costMenu() {
    final List<String> costList = ['일급', '시급', '월급', '건당'];

    return Positioned(
      bottom: 80,
      child: Column(
        children: [
          Visibility(
            visible: true,
            child: Container(
              width: 153,
              height: 176,
              decoration: BoxDecoration(
                color: AppColors.drawerColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: costList.map((cost) {
                    return TextButton(
                      onPressed: () {
                        costSelectedValue = cost;
                        _toggleCostList();
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 18),
                          Text(
                            cost,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: CustomFontWeight.M,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
