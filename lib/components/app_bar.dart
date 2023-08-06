import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_up_front_end/components/icon_components.dart';

import 'colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final AppBar appBar
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
        height: 50,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
                height: 26,
              ),
              Spacer(),
              Container(
                  width: 210,
                  height: 36,
                  // padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 9,bottom: 9),
                  decoration: ShapeDecoration(
                    color: AppColors.secondaryBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15, top: 4),
                      hintText: '어떤 줄서기를 하고 싶은가요?',
                      hintStyle: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: 12,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),
              const Spacer(),
              SvgIcon(
                iconName: 'bell',
                size: 24,
                gradient: AppColors.primaryGradient,
              ),
            ],
          ),


      )
      ,
      // leading: Padding(
      //   //padding vertical
      //   padding: const EdgeInsets.only(left: 26.0),
      //   child: Image.asset("assets/images/logo.png"),
      //
      // ),
      // title: Text('My d'),
      backgroundColor: AppColors.primaryBackgroundColor,
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
