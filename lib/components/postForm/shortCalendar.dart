import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../screen/const/custom_font_weight.dart';
import '../colors.dart';
import 'calendarUtils.dart';

class shortCalendar extends StatefulWidget {
  LinkedHashSet<DateTime> selectedDates = LinkedHashSet(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  final Function(DateTime) onDatesChanged;
  shortCalendar({
    Key? key,
    required this.selectedDates,
    required this.onDatesChanged,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<shortCalendar> {
  bool isShortButtonSelected = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  // DateTime _selectedDay = DateTime.now();

  // range 범위 지정
  // RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  // DateTime? _rangeStart;
  // DateTime? _rangeEnd;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      // Update values in a Set
      if (widget.selectedDates.contains(selectedDay)) {
        widget.selectedDates.remove(selectedDay);
      } else {
        widget.selectedDates.add(selectedDay);
      }
    });
    widget.onDatesChanged(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        const Text(
          "라인업 날짜",
          style: TextStyle(
            fontSize: 14,
            fontWeight: CustomFontWeight.M,
            color: Color(0xffffffff),
            height: 18 / 14,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 14),
        TableCalendar(
          locale: 'ko_KR',
          // 시작 날짜
          firstDay: DateTime.utc(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          // 마지막 날짜
          lastDay: DateTime.utc(DateTime.now().year, DateTime.now().month + 1,
              DateTime.now().day),
          // 포커스 날짜
          focusedDay: _focusedDay,

          // 범위 지정
          // rangeStartDay: _rangeStart,
          // rangeEndDay: _rangeEnd,
          // rangeSelectionMode: _rangeSelectionMode,

          calendarFormat: _calendarFormat,
          weekendDays: [DateTime.sunday],
          // 일요일을 주말로 설정

          availableCalendarFormats: const {
            CalendarFormat.month: 'Month', // 한 달 형식으로 고정
          },
          selectedDayPredicate: (day) {
            return widget.selectedDates.contains(day);
          },
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          onDaySelected: _onDaySelected,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronVisible: true,
            rightChevronVisible: true,
            titleTextFormatter: (date, locale) {
              final currentDate = DateTime.utc(DateTime.now().year,
                  DateTime.now().month, DateTime.now().day);
              final start = DateFormat('y.MM.dd').format(currentDate);
              final end = DateFormat('y.MM.dd')
                  .format(currentDate.add(const Duration(days: 31)));
              return '$start~$end';
            },
            titleTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.SB,
              color: Color(0xffffffff),
              height: 19 / 16,
            ),
          ),
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: false,
            defaultTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.SB,
              color: Color(0xffffffff),
              height: 19 / 16,
            ),

            weekendTextStyle: TextStyle(
              // 주말 글꼴
              fontWeight: CustomFontWeight.SB,
              color: Colors.red,
            ),

            selectedTextStyle: TextStyle(
              color: Colors.black,
            ),
            selectedDecoration: BoxDecoration(
              color: AppColors.primaryButtonColor,
              shape: BoxShape.circle,
            ),

            isTodayHighlighted: false,
            todayTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.SB,
              color: AppColors.accentColor,
              // height: 19/16,
            ),

            // range style 지정
            rangeHighlightColor: AppColors.postFormButtonColor,
            rangeStartDecoration: BoxDecoration(
              color: AppColors.postFormButtonColor,
              shape: BoxShape.circle,
            ),
            rangeStartTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.SB,
              color: Color(0xff000000),
              height: 19 / 16,
            ),
            rangeEndDecoration: BoxDecoration(
              color: AppColors.postFormButtonColor,
              shape: BoxShape.circle,
            ),
            rangeEndTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.SB,
              color: Color(0xff000000),
              height: 19 / 16,
            ),
            withinRangeTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeight.SB,
              color: Color(0xff000000),
              height: 19 / 16,
            ),
          ),
        ),
      ],
    );
  }
}
