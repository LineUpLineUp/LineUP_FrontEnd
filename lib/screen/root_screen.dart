
import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../components/icon_components.dart';
import 'home/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootScreenState();

}

class _RootScreenState extends State<RootScreen> with
    TickerProviderStateMixin {
  // TickerProviderStateMixin 사용하기
  TabController? controller; // 사용할 TabController 선언
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this); // 컨트롤러 초기화하기
    controller?.index = 1;
    // 컨트롤러 속성이 변경될 때마다 실행할 함수 등록
    controller!.addListener(tabListener);
  }

  tabListener() {
    // 리스너로 사용할 함수
    setState(() {});
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener); // 리스너에 등록한 함수 등록 취소
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }


  List<Widget> renderChildren() {
    return [
      Container(
        child: const Center(
          child: Text(
            'Tab 1',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      // Container(
      const HomeScreen(),
      Container(
        child: const Center(
          child: Text(
            'Tab 3',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ];
  }

  Widget renderBottomNavigation() {
    return BottomNavigationBar(
        currentIndex: controller!.index,
        onTap: (int index) {
          setState(() {
            controller!.animateTo(index);
            // controller!.index = index;
          });
        },

        backgroundColor: AppColors.secondaryBackgroundColor,
        unselectedItemColor: AppColors.secondaryTextColor,
        selectedItemColor: AppColors.primaryTextColor,

        items: [
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
        ]
    );
  }
}