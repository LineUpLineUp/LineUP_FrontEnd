import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:line_up_front_end/components/CustomImagePicker.dart';
import 'package:line_up_front_end/components/postForm/locationButton.dart';
import 'package:line_up_front_end/components/postForm/longTime.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';
import 'package:table_calendar/table_calendar.dart';
import '../components/postForm/calendarUtils.dart';
import '../components/postForm/shortCalendar.dart';
import '../components/colors.dart';
import '../components/postForm/shortTime.dart';

class PostForm extends StatefulWidget {
  final String initialText;
  final String imagePath;

  const PostForm({Key? key, required this.initialText, required this.imagePath})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostForm();
}

class _PostForm extends State<PostForm> {
  final formKey = GlobalKey<FormState>();
  bool _showErrors = false;

  // 사진
  File? pickedImage;
  // 라인업 준수 동의 여부
  bool _isRuleCheck = false;
  //줄서기 제목
  TextEditingController _titleEditingController = TextEditingController();
  // 상세 내용
  int maxLength = 1000;
  TextEditingController _textEditingController = TextEditingController();

  // 라인업 날짜
  bool isShortButtonSelected = false;
  bool isLongButtonSelected = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  LinkedHashSet<DateTime> selectedDates = LinkedHashSet(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  List<String> selectedDays = [];

  // PostForm 메뉴 선택
  bool _showMenuList = false;
  bool _isExpanded = false;

  // 라인업 시간
  String selectedStartTime = "09:00";
  String selectedEndTime = "18:00";

  // 라인업 비용
  String costSelectedText = "시급";
  int costSelectedValue = 9620;


  // 최저 임금 동의 여부
  bool minMoney = false;

  String selectedLocation = '어디에서 라인업 하나요?';

  bool isShortFormComplete = false;
  bool isLongFormComplete = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(checkShortFormComplete);
    _titleEditingController.addListener(checkShortFormComplete);
  }

  //TODO: 불러오기
  void _onExportClicked(BuildContext context) {
    print('불러오기 클릭');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryBackgroundColor,
        title: GestureDetector(
          onTap: () {
            _togglePostList();
          },
          child: _showMenuList
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.imagePath,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 9),
                        Text(
                          widget.initialText,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: CustomFontWeight.M,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          SFSymbols.chevron_up,
                          size: 16,
                          color: AppColors.secondaryTextColor,
                        )
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: AppColors.secondaryBackgroundColor,
                      child: Image.asset(
                        widget.imagePath,
                      ),
                    ),
                    SizedBox(width: 9),
                    Text(
                      widget.initialText,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: CustomFontWeight.M,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      SFSymbols.chevron_down,
                      size: 16,
                      color: AppColors.secondaryTextColor,
                    )
                  ],
                ),
        ),
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (_showMenuList) _togglePostList();
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  autovalidateMode: _showErrors
                      ? AutovalidateMode.always
                      : AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(
                    children: [
                      photoSelection(),
                      textForm(),
                      LineupDateForm(),
                    ],
                  ),
                ),
              ),
              if (_showMenuList) _buildItemList(),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePostList() {
    setState(() {
      _showMenuList = !_showMenuList;
      _isExpanded = !_isExpanded;
    });
  }

  Widget _buildItemList() {
    return Positioned(
      // padding: EdgeInsets.only(bottom: 50, right: 29),
      left: 107,
      right: 106,
      // right: 29.0,
      child: Column(
        children: [
          Visibility(
            visible: _isExpanded,
            child: Column(
              children: [
                Container(
                  width: 177,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.floatingListColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showPostDialog('급줄', 'assets/icons/categories/fast.png');
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: AppColors.secondaryBackgroundColor,
                          child: Image.asset(
                            'assets/icons/categories/fast.png',
                          ),
                        ),
                        const SizedBox(width: 9),
                        const Text(
                          '급줄',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: CustomFontWeight.M,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 177,
                  height: 192,
                  decoration: BoxDecoration(
                    color: AppColors.floatingListColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          showPostDialog('백화점',
                              'assets/icons/categories/department_store.png');
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/department_store.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '백화점',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showPostDialog(
                              '음식점', 'assets/icons/categories/restaurant.png');
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/restaurant.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '음식점',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showPostDialog('팝업스토어',
                              'assets/icons/categories/pop_up_store.png');
                        },
                        child: Row(
                          children: [
                            // const SizedBox(width: 16),
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/pop_up_store.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '팝업스토어',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showPostDialog(
                              '카페', 'assets/icons/categories/cafe.png');
                        },
                        child: Row(
                          children: [
                            // const SizedBox(width: 16),
                            Container(
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryBackgroundColor,
                              child: Image.asset(
                                'assets/icons/categories/cafe.png',
                              ),
                            ),
                            const SizedBox(width: 9),
                            const Text(
                              '카페',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: CustomFontWeight.M,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showPostDialog(String changedText, String changedImage) {
    return showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (_) {
          return Center(
            child: AlertDialog(
              backgroundColor: AppColors.floatingListColor,

              // TODO:circular가 제대로 먹지 않음
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: 338,
                height: 400,
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    Image.asset(
                      'assets/icons/postForm/postAlert.png',
                      width: 79,
                      height: 117,
                    ),
                    const SizedBox(height: 30),
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '라인업 공고를',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: CustomFontWeight.B,
                              color: Colors.white,
                              height: 28 / 20,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                          ),
                          TextSpan(
                            text: '변경',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: CustomFontWeight.B,
                              color: Colors.red,
                              height: 28 / 20,
                            ),
                          ),
                          TextSpan(
                            text: '하시나요?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: CustomFontWeight.B,
                              color: Colors.white,
                              height: 28 / 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "입력된 공고내역을 가지고 가시려면 저장을,\n아니면 새로쓰기를 눌러주세요 ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: CustomFontWeight.L,
                        color: Colors.white,
                        height: 0,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 136,
                      height: 41,
                      decoration: BoxDecoration(
                        color: AppColors.primaryButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostForm(
                                      initialText: changedText,
                                      imagePath: changedImage,
                                    )),
                          ); // 다른 페이지의 위젯
                        },
                        child: Text(
                          '새로쓰기',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: CustomFontWeight.B,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 136,
                      height: 41,
                      decoration: BoxDecoration(
                        color: AppColors.floatingButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          //  TODO: 저장 부분, DTO 생성해야함.
                        },
                        child: Text(
                          '저장',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: CustomFontWeight.B,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget photoSelection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 22),
          Row(
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
                  fontWeight: CustomFontWeight.M,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "해당 라인업과 관련된 사진을 올려보세요.",
            style: TextStyle(
              fontSize: 12,
              fontWeight: CustomFontWeight.L,
              color: Color(0xffb0afaf),
            ),
          ),
          const SizedBox(height: 16),
          //  사진 선택
          // CustomImagePicker(),
          CustomImagePicker(
            pickedImage: pickedImage,
            onImageChanged: (newImage) {
              pickedImage = newImage;
            },
          ),
        ],
      ),
    );
  }

  Widget textForm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          const Text(
            "제목",
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _titleEditingController,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: CustomFontWeight.L,
            ),
            decoration: InputDecoration(
              hintText: '줄서기 제목',
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: CustomFontWeight.L,
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
          const SizedBox(height: 32),
          const Text(
            "상세 내용",
            style: TextStyle(
              fontSize: 14,
              fontWeight: CustomFontWeight.M,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: TextFormField(
              controller: _textEditingController,
              maxLength: maxLength,
              maxLines: 10,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: CustomFontWeight.L,
              ),
              decoration: InputDecoration(
                hintText: '예) 근무 조건, 우대 사항, 라이너가 갖추어야 할 자세 등',
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: CustomFontWeight.L,
                  color: Color(0xffb0afaf),
                  // height: 15/12 ,
                ),
                counterText: "${_textEditingController.text.length}/$maxLength",
                counterStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: CustomFontWeight.L,
                  color: Color(0xffb0afaf),
                  height: 13 / 10,
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
                if (value == null || value.isEmpty || value.length < 10) {
                  return "최소 10자이상 입력해주세요.";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _showErrors = value.isEmpty;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget LineupDateForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          Text(
            "라인업 기간",
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isShortButtonSelected) {
                      isShortButtonSelected = !isShortButtonSelected;
                    } else {
                      isShortButtonSelected = !isShortButtonSelected;
                      isLongButtonSelected = false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isShortButtonSelected
                      ? AppColors.postFormButtonColor
                      : AppColors.primaryBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  '단기',
                  style: TextStyle(
                    color: isShortButtonSelected
                        ? const Color(0xff000000)
                        : const Color(0xffffffff),
                    fontSize: 12,
                    fontWeight: CustomFontWeight.B,
                    height: 14 / 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isLongButtonSelected) {
                      isLongButtonSelected = !isLongButtonSelected;
                    } else {
                      isLongButtonSelected = !isLongButtonSelected;
                      isShortButtonSelected = false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLongButtonSelected
                      ? AppColors.postFormButtonColor
                      : AppColors.primaryBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  '1개월 이상',
                  style: TextStyle(
                    color: isLongButtonSelected
                        ? const Color(0xff000000)
                        : const Color(0xffffffff),
                    fontSize: 12,
                    fontWeight: CustomFontWeight.B,
                    height: 14 / 12,
                  ),
                ),
              ),
            ],
          ),
          if (isShortButtonSelected) // 버튼이 선택됐을 때만 달력을 보여줌
            Column(
              children: [
                shortCalendar(
                  selectedDates: selectedDates,
                  onDatesChanged: (newDates) {
                    checkShortFormComplete();
                  },
                ),
                shortTime(
                  selectedStartTime: selectedStartTime,
                  selectedEndTime: selectedEndTime,
                  onStartTimeChanged: (newStartTime) {
                    selectedStartTime = newStartTime;
                  },
                  onEndTimeChanged: (newStartTime) {
                    selectedEndTime = newStartTime;
                  },
                  costSelectedText: costSelectedText,
                  costSelectedValue: costSelectedValue,
                  onCostTextChanged: (newCostText) {
                    costSelectedText = newCostText;
                  },
                  onCostValueChanged: (newCostValue) {
                    costSelectedValue = newCostValue;
                  },
                ),
                locationButton(
                    selectedLocation: selectedLocation,
                    onLocationChanged: (newLocation) {
                      setState(() {
                        selectedLocation = newLocation;
                      });
                      checkShortFormComplete();
                    }),
                // phoneSave(phoneNumber: ''),
                const SizedBox(height: 58),
                Row(
                  children: [
                    Checkbox(
                      value: _isRuleCheck,
                      onChanged: (newValue) {
                        setState(() {
                          _isRuleCheck = newValue!;
                        });
                        checkShortFormComplete();
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

                Container(
                  width: 361,
                  height: 52,
                  child: ElevatedButton(
                    style: isShortFormComplete
                        ? ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        : ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                    onPressed: () {
                      setState(() {
                        // checkShortFormComplete();
                      });
                      // TODO: 서버에 데이터 전송(단기 포스트)
                      isShortFormComplete ? print('저장') : null;
                    },
                    child: Text(
                      '완료',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: CustomFontWeight.B,
                        color: Colors.black,
                        // height: 15 / 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          if (isLongButtonSelected) // 버튼이 선택됐을 때만 달력을 보여줌
            Column(
              children: [
                longTime(
                  selectedDays: selectedDays,
                  onSelectedDaysChanged: (newDay) {
                    checkLongFormComplete();
                  },
                  selectedStartTime: selectedStartTime,
                  selectedEndTime: selectedEndTime,
                  onStartTimeChanged: (newStartTime) {
                    selectedStartTime = newStartTime;
                  },
                  onEndTimeChanged: (newStartTime) {
                    selectedEndTime = newStartTime;
                  },
                  costSelectedText: costSelectedText,
                  costSelectedValue: costSelectedValue,
                  onCostTextChanged: (newCostText) {
                    costSelectedText = newCostText;
                  },
                  onCostValueChanged: (newCostValue) {
                    // costSelectedValue = int.parse(newCostValue);
                    costSelectedValue = newCostValue;
                  },
                ),
                locationButton(
                    selectedLocation: selectedLocation,
                    onLocationChanged: (newLocation) {
                      setState(() {
                        selectedLocation = newLocation;
                      });
                      checkLongFormComplete();
                    }),
                // phoneSave(phoneNumber: ''),
                const SizedBox(height: 58),
                Row(
                  children: [
                    Checkbox(
                      value: _isRuleCheck,
                      onChanged: (newValue) {
                        setState(() {
                          _isRuleCheck = newValue!;
                        });
                        checkLongFormComplete();
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
                Container(
                  width: 361,
                  height: 52,
                  child: ElevatedButton(
                    style: isLongFormComplete
                        ? ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                        : ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      setState(() {
                        // checkShortFormComplete();
                      });
                      // TODO: 서버에 데이터 전송(단기 포스트) -> 이후 메인 화면으로
                      isLongFormComplete ? print('저장') : null;
                    },
                    child: Text(
                      '완료',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: CustomFontWeight.B,
                        color: Colors.black,
                        // height: 15 / 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void checkShortFormComplete() {
    final isTitleValid = _titleEditingController.text.isNotEmpty;
    final isDetailValid = _textEditingController.text.length >= 10;
    final isDateSelected = selectedDates.isNotEmpty;
    final isLocationValid = selectedLocation != '어디에서 라인업 하나요?';

    setState(() {
      isShortFormComplete = isTitleValid && isDetailValid && isDateSelected && isLocationValid && _isRuleCheck;
    });
  //  TODO: 서버에 데이터 전송 후 삭제 예정
  //       // print(_titleEditingController.text.isNotEmpty);
  //       // print(_textEditingController.text.length);
  //       // print(_isRuleCheck);
  //       // print(selectedDates.isNotEmpty);
  //       // print(selectedLocation != '어디에서 라인업 하나요?');
  //       // print('\n');
  //       // print(isShortFormComplete);
  //       // print(selectedLocation);
  //       // print(widget.initialText);
  //       //
  //       // print('단기 : $isShortButtonSelected');
  //       // print('장기 : $isLongButtonSelected');
  //       // print('서약체크 : $_isRuleCheck');
  //       // print(selectedStartTime);
  //       // print(selectedEndTime);
  //       // print(costSelectedValue);
  //       // print(costSelectedText);
  //       // print(pickedImage);
  //       // print(selectedDates);
  //       // print(_titleEditingController.text);
  //       // print(_textEditingController.text);
  }

  void checkLongFormComplete() {
    final isTitleValid = _titleEditingController.text.isNotEmpty;
    final isDetailValid = _textEditingController.text.length >= 10;
    final isDateSelected = selectedDays.isNotEmpty;
    final isLocationValid = selectedLocation != '어디에서 라인업 하나요?';

    setState(() {
      isLongFormComplete = isTitleValid && isDetailValid && isDateSelected && isLocationValid && _isRuleCheck;
    });
    //  TODO: 서버에 데이터 전송 후 삭제 예정
  //   print(_titleEditingController.text.isNotEmpty);
  //   print(_textEditingController.text.length);
  //   print(_isRuleCheck);
  //   print(selectedDates.isNotEmpty);
  //   print(selectedLocation != '어디에서 라인업 하나요?');
  //   print('\n');
  //   print(isLongFormComplete);
  //   print(selectedLocation);
  //   print(widget.initialText);
  //
  //   print('단기 : $isShortButtonSelected');
  //   print('장기 : $isLongButtonSelected');
  //   print('서약체크 : $_isRuleCheck');
  //   print(selectedStartTime);
  //   print(selectedEndTime);
  //   print(costSelectedValue);
  //   print(costSelectedText);
  //   print(pickedImage);
  //   print(selectedDays);
  //   print(_titleEditingController.text);
  //   print(_textEditingController.text);
  }
}
