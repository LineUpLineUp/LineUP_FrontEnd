import 'dart:collection';
import 'dart:convert';
import 'dart:io';

class LineTime {
  final LinkedHashSet<DateTime> selectedDates; // 라인업 날짜
  final String startTime; // 라인업 시작 시간
  final String endTime; // 라인업 종료 시간

  LineTime(this.selectedDates, this.startTime, this.endTime);

  Map<String, dynamic> toJson() {
    return {
      'selectedDates': selectedDates.map((date) => date.toIso8601String()).toList(),
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}

class shortTermPosts {
  final String postMenu; // post의 종류
  final String title; // post 제목
  final File? selectedImage; // 사진
  final String detail; // 상세 내용
  final String costSelectedText; // 라인업 비용 종류(일급, 시급, 단기, 월급)
  final int costSelectedValue; // 라인업 비용
  final String location; // 라인업 위치
  final bool isRuleCheck; // 라인업 준수 동의
  // final bool minMoney;
  final LineTime time;

  shortTermPosts(
      this.postMenu,
      this.title,
      this.selectedImage,
      this.detail,
      this.costSelectedText,
      this.costSelectedValue,
      this.location,
      this.isRuleCheck,
      this.time
  );

  Map<String, dynamic> toJson() {
    String? selectedImageBase64;
    if (selectedImage != null) {
      List<int> imageBytes = selectedImage!.readAsBytesSync();
      selectedImageBase64 = base64Encode(imageBytes);
    }

    return {
      'postMenu': postMenu,
      'title': title,
      'selectedImage': selectedImageBase64,
      'detail' : detail,
      'costSelectedText' : costSelectedText,
      'costSelectedValue' : costSelectedValue,
      'location' : location,
      'isRuleCheck' : isRuleCheck,
      'time' : time.toJson(),
    };
  }
}
