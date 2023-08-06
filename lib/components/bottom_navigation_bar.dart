// bottom_navigation_bar.dart
import 'package:flutter/material.dart';

import 'package:line_up_front_end/components/colors.dart';
import 'package:line_up_front_end/components/icon_components.dart';
import 'dart:async';

class CustomBottomNavigationBar extends StatefulWidget {
  final ScrollController scrollController;
  CustomBottomNavigationBar({required this.scrollController});
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();

}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  double _blurValue = 0.0;
  int _selectedIndex = 0;

  double _lastOffset = 0.0;
  DateTime _lastTime = DateTime.now();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final currentOffset = widget.scrollController.offset;
    final currentTime = DateTime.now();

    final scrollSpeed = (currentOffset - _lastOffset).abs() ;

    setState(() {
      _blurValue = scrollSpeed.clamp(0.0, 20.0);
    });

    _lastOffset = currentOffset;
    _lastTime = currentTime;

    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        _blurValue = 0.0;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: _blurValue > 1
        ?BoxDecoration(
          boxShadow: <BoxShadow>[
            // 그림자효과
            BoxShadow(
              color: AppColors.primaryBlurColor.withOpacity(0.3),
              offset: Offset(0.0, _blurValue),
              blurRadius: 20,
            ),
          ],
        )
      : null,
        height: 110.0,
        padding: EdgeInsets.only(bottom: 0.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgIcon(iconName: 'message'),
                activeIcon: SvgIcon(
                  iconName: 'message',
                  gradient: AppColors.primaryGradient,
                ),
                label: '채팅',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(iconName: 'home'),
                activeIcon: SvgIcon(
                  iconName: 'home',
                  gradient: AppColors.primaryGradient,
                ),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(iconName: 'profile'),
                activeIcon: SvgIcon(
                  iconName: 'profile',
                  gradient: AppColors.primaryGradient,
                ),
                label: '마이페이지',
              ),
            ],
            currentIndex: _selectedIndex,
            backgroundColor: AppColors.primaryBackgroundColor,
            unselectedItemColor: AppColors.secondaryTextColor,
            selectedItemColor: AppColors.primaryTextColor,
            onTap: _onItemTapped,

          ),
        ),
    );
  }
}
