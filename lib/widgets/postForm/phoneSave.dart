import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_up_front_end/constants/custom_font_weight.dart';

class phoneSave extends StatefulWidget {
  final String phoneNumber;

  phoneSave({required this.phoneNumber});

  @override
  State<StatefulWidget> createState() => _phoneSave();
}

class _phoneSave extends State<phoneSave> {
  final TextEditingController phoneNumberController = TextEditingController();
  String? errorMessage;
  bool _isRuleCheck = false;

  void _savePhoneNumber() {
    final String phoneNumber = phoneNumberController.text;

    if (phoneNumber.isEmpty) {
      setState(() {
        errorMessage = "전화번호를 입력해주세요.";
      });
    } else {
      // TODO:연락처 저장 로직 추가
      print("연락처 저장: ${phoneNumber}");
      setState(() {
        errorMessage = null;
        phoneNumberController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        Text(
          "라이너 연락처",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: CustomFontWeight.M,
            color: Color(0xffffffff),
            height: 18 / 14,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          "전화번호는 안심번호로 표시돼요.",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: CustomFontWeight.M,
            color: Color(0xff313235),
            height: 14 / 12,
          ),
        ),
        const SizedBox(height: 9),
        Container(
          width: 338,
          height: 44,
          child: TextFormField(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
              height: 18 / 14,
            ),
            onTap: () {},
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // 숫자만 허용
            ],
            decoration: InputDecoration(
              hintText: "연락할 수 있는 번호를 적어주세요.",
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: CustomFontWeight.M,
                color: Color(0xffb0afaf),
                height: 14 / 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: _isRuleCheck,
              onChanged: (newValue) {
                setState(() {
                  _isRuleCheck = newValue!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                color: Colors.white,
              ),
            ),
            Text(
              "라인업 줄서기 대행 준수사항 동의",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: CustomFontWeight.M,
                color: Color(0xffffffff),
                height: 18 / 14,
              ),
            ),
            const SizedBox(width: 60),
            IconButton(
              onPressed: () {
                print('서약내놔');
              },
              icon: Icon(
                SFSymbols.chevron_down,
                size: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 67),
        GestureDetector(
          onTap: () {
          //  TODO: 모든 내용이 기입시 complete.png처럼 색깔 활성화
          },
          child: Image.asset(
            'assets/icons/postForm/notComplete.png',
          ),
        ),
      ],
    );
  }
}
