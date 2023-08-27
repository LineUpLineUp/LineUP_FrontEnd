import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_up_front_end/components/postForm/locationButton.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';
import 'package:line_up_front_end/screen/post_form.dart';

import '../../application/addressBloc.dart';
import '../../components/colors.dart';
import '../../models/location.dart';

class locationSearch extends StatefulWidget {
  static const String routeName = '/navigator/address_search';
  locationSearch({
    Key? key,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _locationSearch();
}

class _locationSearch extends State<locationSearch> {
  final searchTec = TextEditingController();
  final scrollController = ScrollController();
  final addressBloc = AddressBloc();
  List<Juso> addressList = [];
  String keyword = "", errorMessage = "검색어를 입력하세요.";
  int page = 1;

  // Juso? selectedAddress;

  @override
  void initState() {
    super.initState();
    addAddressStreamListener();
    addScrollListener();
    addTextEditListener();
  }

  void onListItemTapped(String selectedAddress) {
    Navigator.pop(context, selectedAddress);
  }

  addAddressStreamListener() {
    addressBloc.address.listen(
      (list) {
        addressList = list;
        setState(() {});
      },
      onError: (error, stacktrace) {
        // print("onError: $error");
        // print(stacktrace.toString());

        if (error is ErrorModel == false) return;

        ErrorModel errorModel = error;
        if (page == 1) addressList = [];
        if (errorModel.error == -101) page = -1;

        errorMessage = errorModel.message;
        setState(() {});
      },
    );
  }

  addScrollListener() {
    scrollController.addListener(() {
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }

  addTextEditListener() {
    searchTec.addListener(() async {
      if (keyword == searchTec.text) return;
      keyword = searchTec.text;
      page = 1;
      addressBloc.fetchAddress(keyword, page);
    });
  }

  @override
  void dispose() {
    addressBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        title: const Text(
          "위치 검색",
          style: TextStyle(
            fontSize: 16,
            fontWeight: CustomFontWeight.B,
            color: Color(0xffffffff),
            height: 22 / 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    searchTextField(),
                  ],
                ),
                const SizedBox(height: 20),
                // listView(),
                Expanded(child: listView()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      // color: AppColors.primaryBackgroundColor,
      padding: EdgeInsets.only(left: 17),
      height: 44,
      width: 338,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AppColors.primaryButtonColor,
        ),
      ),
      // alignment: Alignment.center,
      child: TextField(
        controller: searchTec,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: CustomFontWeight.M,
          color: Color(0xffb0afaf),
          // height: 17/14,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "도로명, 건물명, 번지 검색",
          hintStyle: TextStyle(color: AppColors.locationHintTextColor),
        ),
      ),
    );
  }

  Widget cancelWidget() {
    if (keyword == null || keyword.isEmpty) return Container();

    return GestureDetector(
      child: Icon(
        Icons.cancel,
        color: Color(0xFFBFBFBF),
        size: 20,
      ),
      onTap: () => searchTec.clear(),
    );
  }

  Widget listView() {
    if (addressList.length == 0) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 22),
          Text(
            "이렇게 검색해보세요",
            style: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.SB,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "도로명 + 건물번호",
            style: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
            ),
          ),
          Text(
            "예) 숲속마을 1로 85",
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.L,
              color: AppColors.accentColor,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "동/읍/면/리 + 번지",
            style: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
              height: 19 / 16,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "예) 마북동 630 ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.L,
              color: AppColors.accentColor,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "건물명, 아파트명",
            style: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
            ),
          ),
          Text(
            "예) 삼성 래미안",
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.L,
              color: AppColors.accentColor,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: addressList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0)
          return SvgPicture.asset(
            'assets/icons/drawLine2.svg',
          );
        if (index == addressList.length) addAddressList();

        final address = addressList[index - 1];
        return Column(
          children: [
            listItem(address),
            SvgPicture.asset(
              'assets/icons/drawLine2.svg',
            ),
          ],
        );
      },
    );
  }

  Widget listItem(Juso address) {
    return GestureDetector(
      onTap: () {
        onListItemTapped(address.roadAddr);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 26, right: 26, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              address.zipNo,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: CustomFontWeight.L,
                color: AppColors.accentColor,
                height: 17 / 14,
              ),
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                Container(
                  color: Color(0xff2B2E32),
                  width: 26,
                  height: 7,
                  child: const Text(
                    "도로명",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: CustomFontWeight.M,
                      color: Color(0xff909090),
                      height: 7 / 10,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    address.roadAddr,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: CustomFontWeight.M,
                      color: Color(0xffb0afaf),
                      height: 1.2,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 18,
                  height: 7,
                  color: Color(0xff2B2E32),
                  child: const Text(
                    "지번",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: CustomFontWeight.M,
                      color: Color(0xff909090),
                      height: 7 / 10,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(width: 18),
                Flexible(
                  child: Text(
                    address.jibunAddr,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: CustomFontWeight.M,
                      color: Color(0xffb0afaf),
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  addAddressList() {
    if (page == -1) return;
    ++page;
    addressBloc.fetchAddress(keyword, page);
  }
}

class TopBar extends StatelessWidget {
  TopBar({
    Key? key,
    required this.title,
    this.onTap,
    this.closeIcon,
    this.height = 60,
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final Icon? closeIcon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          titleWidget(),
          closeWidget(context),
        ],
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: height,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget closeWidget(BuildContext context) {
    return SizedBox(
      height: height,
      width: height,
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Color(0xFF757575),
          onTap: onTap != null ? onTap : () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: closeIcon == null ? Icon(Icons.close) : closeIcon,
          ),
        ),
      ),
    );
  }
}
