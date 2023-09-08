import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_up_front_end/constants/colors.dart';
import 'package:line_up_front_end/constants/custom_font_weight.dart';
import 'package:line_up_front_end/views/location/location_search.dart';

class locationButton extends StatefulWidget {
  final String selectedLocation;
  final Function(String) onLocationChanged;
  const locationButton({
    Key? key,
    required this.selectedLocation,
    required this.onLocationChanged,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _locationButton();
}

class _locationButton extends State<locationButton> {
  // String selectedLocation = "어디에서 라인업 하나요?";
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
          onTap: () async {
            final newLocation =
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => locationSearch()
              ),
            );
            if (newLocation != null) {
              widget.onLocationChanged(newLocation);
            }
            // Navigator.of(context).pop();
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
                SvgPicture.asset(
                  'assets/icons/location/location_square.svg',
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.selectedLocation,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: CustomFontWeight.L,
                      color: Color(0xffb0afaf),
                      height: 15 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
