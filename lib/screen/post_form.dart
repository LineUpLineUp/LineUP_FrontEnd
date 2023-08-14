import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';

import '../components/colors.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostForm();
}

class _PostForm extends State<PostForm> {
  final formKey = GlobalKey<FormState>();
  bool _showErrors = false;
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  int currentHour = DateTime.now().hour;
  int currentTime = DateTime.now().minute;
  late TimeOfDay _startedTime;
  late DateTime _endedTime;


  @override
  void initState() {
    super.initState();
    _startedTime = TimeOfDay.now();
    _endedTime = DateTime.now();

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
                setState(() {
                  _startedTime = TimeOfDay.fromDateTime(newTime);
                });
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
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: _showErrors
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 10,),
                const Text(
                  "해당 라인업과 관련된 사진을 올려보세요.",
                  style: TextStyle(
                    fontFamily: "AppleSDGothicNeoL00",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffb0afaf),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: Image.asset(
                    'assets/icons/postForm/image_select.png',
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    print('사진 선택');
                  },
                  iconSize: 64,
                ),
                const SizedBox(height: 32),
                const Text(
                  '제목',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: '줄서기 제목',
                    hintStyle: TextStyle(
                      fontFamily: "AppleSDGothicNeoL00",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
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
                const SizedBox(height: 56),
                const Text(
                  '라인업 날짜',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: CustomFontWeight.M,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),
                const Row(
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
                const SizedBox(height: 138),
                const Text(
                  '라인업 시간',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: CustomFontWeight.M,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 14),
                const Row(
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
                        fontFamily: "AppleSDGothicNeoL00",
                        fontSize: 12,
                        fontWeight: CustomFontWeight.L,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  style: const TextStyle(

                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 18/14,
                  ),
                  readOnly: true,
                  onTap: _showTimePicker,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  initialValue: "${_startedTime.hour}:${_startedTime.minute}",
                ),
              ],
            ),
          ) 

        ),
      ),
    );
  }
}
