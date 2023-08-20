import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_up_front_end/components/colors.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';
import 'myDropDown.dart';

class shortTime extends StatefulWidget {
  const shortTime({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _shortTime();
}

class _shortTime extends State<shortTime> {
  final List<DateTime> items = List.generate(
      50, (index) => DateTime.now().add(Duration(minutes: 10 * index)));

  final DateTime _startedTime = DateTime.now();
  bool _showItemList = false;
  bool _isExpanded = false;

  // 라인업 비용
  String costSelectedValue = '';

  void SetCostSelectedValue(String value) {
    setState(() {
      costSelectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 60),
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
            Container(
              width: 153,
              height: 44,
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: CustomFontWeight.M,
                  color: Colors.white,
                  height: 18 / 14,
                ),
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                initialValue: "09:00",
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
            Container(
              width: 153,
              height: 44,
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: CustomFontWeight.M,
                  color: Colors.white,
                  height: 18 / 14,
                ),
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                initialValue: "18:00",
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
            MyDropDown(
              initValue: '시급',
              selectedValue: costSelectedValue,
              onSelected: SetCostSelectedValue,
              options: ['일급', '시급', '월급', '건당'],
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
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // 숫자만 허용
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
