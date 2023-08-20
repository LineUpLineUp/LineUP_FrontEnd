import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_up_front_end/components/colors.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';

class MyDropDown extends StatefulWidget {
  final String initValue;
  final String selectedValue;
  final Function(String) onSelected;
  final List<String> options;

  MyDropDown({
    required this.initValue,
    required this.selectedValue,
    required this.onSelected,
    required this.options,
  });

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropDown> {
  bool isDropdownOpen = false;

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            width: 153,
            height: 44,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryButtonColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // widget.selectedValue,
                  widget.initValue,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: CustomFontWeight.M,
                    color: Color(0xffffffff),
                    height: 18 / 14,
                  ),
                ),
                isDropdownOpen
                    ? Icon(
                  Icons.arrow_drop_up,
                  color: Colors.white,
                  size: 18,
                )
                    : Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            width: 153,
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryButtonColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: widget.options.map((option) {
                return GestureDetector(
                  onTap: () {
                    widget.onSelected(option);
                    toggleDropdown();
                  },
                  child: Container(
                    width: 153,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColors.primaryButtonColor)),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: CustomFontWeight.M,
                        color: Color(0xffffffff),
                        height: 18 / 14,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:line_up_front_end/screen/const/custom_font_weight.dart';
//
//
// class MyDropDown extends StatefulWidget {
//   final String selectedValue;
//   final Function(String) onSelected;
//   final List<String> options;
//
//   MyDropDown({
//     required this.selectedValue,
//     required this.onSelected,
//     required this.options,
//   });
//
//   @override
//   _MyDropdownState createState() => _MyDropdownState();
// }
//
// class _MyDropdownState extends State<MyDropDown> {
//   bool isDropdownOpen = false;
//
//   void toggleDropdown() {
//     setState(() {
//       isDropdownOpen = !isDropdownOpen;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         GestureDetector(
//           onTap: toggleDropdown,
//           child: Container(
//             width: 153,
//             height: 44,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   widget.selectedValue,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: CustomFontWeight.M,
//                     color: Color(0xffffffff),
//                     height: 18 / 14,
//                   ),
//                 ),
//                 isDropdownOpen?
//                     Icon(
//                         Icons.arrow_drop_up,
//                       color: Colors.white,
//                       size: 18,
//                 ) :
//                     Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.white,
//                       size: 18,
//                     ),
//               ],
//             ),
//           ),
//         ),
//         if (isDropdownOpen)
//           Container(
//           width: 153,
//           height: 176,
//           margin: EdgeInsets.only(top: 5),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             border: Border.all(),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             children: widget.options.map((option) {
//               return GestureDetector(
//                 onTap: () {
//                   widget.onSelected(option);
//                   toggleDropdown();
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 12),
//                   child: Text(
//                     option,
//                     style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: CustomFontWeight.M,
//                     color: Color(0xffffffff),
//                     height: 18/14,
//                   ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           ),
//       ],
//     );
//   }
// }
