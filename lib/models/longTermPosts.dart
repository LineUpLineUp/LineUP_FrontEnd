import 'dart:convert';
import 'dart:io';

class LineTime{
  List<String> selectedDays;
  String startTime;
  String endTime;

  LineTime(this.selectedDays, this.startTime, this.endTime);

  Map<String, dynamic> toJson() {
    return {
      'selectedDays': selectedDays.toList(),
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}

class LongTermPosts {
  final String postMenu; // post의 종류
  final String title; // post 제목
  final File? selectedImage; // 사진
  final String detail; // 상세 내용
  final String costSelectedText; // 라인업 비용 종류(일급, 시급, 단기, 월급)
  final String costSelectedValue; // 라인업 비용
  final String location; // 라인업 위치
  final bool isRuleCheck; // 라인업 준수 동의
  // final bool minMoney;
  final LineTime time;

  LongTermPosts(
      this.postMenu,
      this.title,
      this.selectedImage,
      this.detail,
      this.costSelectedText,
      this.costSelectedValue,
      this.location,
      this.isRuleCheck,
      this.time
      ); // 준수 동의 여부

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
