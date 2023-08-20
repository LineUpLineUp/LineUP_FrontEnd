import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_up_front_end/components/colors.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';
import 'package:line_up_front_end/screen/location/locationSearch.dart';

class locationButton extends StatefulWidget {
  const locationButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _locationButton();
}

class _locationButton extends State<locationButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        Text(
          "라인업 위치",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: CustomFontWeight.M,
            color: Color(0xffffffff),
            height: 18 / 14,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const locationSearch()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryButtonColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 26),
            width: 338,
            height: 44,
            child: Row(
              children: [
                // const SizedBox(width: 15),
                SvgPicture.asset(
                  'assets/icons/location/location_square.svg',
                ),
                const SizedBox(width: 10),
                Text(
                  "어디에서 라인업 하나요?",
                  style: const TextStyle(
                    fontFamily: "AppleSDGothicNeoL00",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffb0afaf),
                    height: 15 / 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
