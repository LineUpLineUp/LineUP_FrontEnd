import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_up_front_end/components/CustomImagePicker.dart';
import 'package:line_up_front_end/components/postForm/locationButton.dart';
import 'package:line_up_front_end/components/postForm/longTime.dart';
import 'package:line_up_front_end/components/postForm/phoneSave.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/postForm/shortCalendar.dart';
import '../components/colors.dart';
import '../components/postForm/shortTime.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostForm();
}

class _PostForm extends State<PostForm> {
  final formKey = GlobalKey<FormState>();
  bool _showErrors = false;

  // 상세 내용
  int maxLength = 1000;
  TextEditingController _textEditingController = TextEditingController();

  // 라인업 날짜
  bool isShortButtonSelected = false;
  bool isLongButtonSelected = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  //TODO: 불러오기
  void _onExportClicked(BuildContext context) {
    print('불러오기 클릭');
  }

  void _showTimePicker() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newTime) {
                setState(() {});
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        title: Text('OOO'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28, top: 20),
            child: GestureDetector(
              onTap: () => _onExportClicked(context),
              child: const Text(
                "불러오기",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: _showErrors
                ? AutovalidateMode.always
                : AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                photoSelection(),
                textForm(),
                LineupDateForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget photoSelection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),
          Row(
            children: [
              Text(
                '사진',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: CustomFontWeight.M,
                ),
              ),
              Text(
                ' (선택)',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFAFAFAF),
                  fontWeight: CustomFontWeight.M,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "해당 라인업과 관련된 사진을 올려보세요.",
            style: TextStyle(
              fontSize: 12,
              fontWeight: CustomFontWeight.L,
              color: Color(0xffb0afaf),
            ),
          ),
          const SizedBox(height: 26),
          //  사진 선택
          CustomImagePicker(),
        ],
      ),
    );
  }

  Widget textForm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          const Text(
            "제목",
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: CustomFontWeight.L,
            ),
            decoration: InputDecoration(
              hintText: '줄서기 제목',
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: CustomFontWeight.L,
                color: Color(0xffb0afaf),
                // height: 15/12 ,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _showErrors
                      ? Colors.red
                      : AppColors.secondaryBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "필수로 입력해주세요.";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _showErrors = value.isEmpty;
              });
            },
          ),
          const SizedBox(height: 32),
          const Text(
            "상세 내용",
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: TextFormField(
              controller: _textEditingController,
              maxLength: maxLength,
              maxLines: 10,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: CustomFontWeight.L,
              ),
              decoration: InputDecoration(
                hintText: '예) 근무 조건, 우대 사항, 라이너가 갖추어야 할 자세 등',
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: CustomFontWeight.L,
                  color: Color(0xffb0afaf),
                  // height: 15/12 ,
                ),
                counterText: "${_textEditingController.text.length}/$maxLength",
                counterStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: CustomFontWeight.L,
                  color: Color(0xffb0afaf),
                  height: 13 / 10,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _showErrors
                        ? Colors.red
                        : AppColors.secondaryBackgroundColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 10) {
                  return "최소 10자이상 입력해주세요.";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _showErrors = value.isEmpty;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget LineupDateForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          Text(
            "라인업 기간",
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isShortButtonSelected) {
                      isShortButtonSelected = !isShortButtonSelected;
                    } else {
                      isShortButtonSelected = !isShortButtonSelected;
                      isLongButtonSelected = false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isShortButtonSelected
                      ? AppColors.postFormButtonColor
                      : AppColors.primaryBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  '단기',
                  style: TextStyle(
                    color: isShortButtonSelected
                        ? const Color(0xff000000)
                        : const Color(0xffffffff),
                    fontSize: 12,
                    fontWeight: CustomFontWeight.B,
                    height: 14 / 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isLongButtonSelected) {
                      isLongButtonSelected = !isLongButtonSelected;
                    } else {
                      isLongButtonSelected = !isLongButtonSelected;
                      isShortButtonSelected = false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLongButtonSelected
                      ? AppColors.postFormButtonColor
                      : AppColors.primaryBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  '1개월 이상',
                  style: TextStyle(
                    color: isLongButtonSelected
                        ? const Color(0xff000000)
                        : const Color(0xffffffff),
                    fontSize: 12,
                    fontWeight: CustomFontWeight.B,
                    height: 14 / 12,
                  ),
                ),
              ),
            ],
          ),
          if (isShortButtonSelected) // 버튼이 선택됐을 때만 달력을 보여줌
            Column(
              children: [
                shortCalendar(),
                shortTime(),
                locationButton(),
                phoneSave(phoneNumber: ''),
              ],
            ),
          if (isLongButtonSelected) // 버튼이 선택됐을 때만 달력을 보여줌
            Column(
              children: [
                longTime(),
                locationButton(),
                phoneSave(phoneNumber: ''),
              ],
            )


        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
