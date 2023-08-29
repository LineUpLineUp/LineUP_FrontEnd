import 'dart:core';

class Address {
  Common common;
  List<Juso> jusoList;

  Address({
    required this.common,
    required this.jusoList,
  });

  factory Address.formJson(Map<String, dynamic> json) {
    final results = json['results'];
    final common = Common.fromJson(results['common']);
    List<Juso> jusoList = [];
    if (results['juso'] != null) {
      final jusoJsonList = results['juso'] as List;
      jusoList = jusoJsonList.map((item) => Juso.fromJson(item)).toList();
    }

    return Address(
      common: common,
      jusoList: jusoList,
    );
  }
}

class Common {
  String errorMessage;
  String countPerPage;
  String totalCount;
  String errorCode;
  String currentPage;

  Common({
    required this.errorMessage,
    required this.countPerPage,
    required this.totalCount,
    required this.errorCode,
    required this.currentPage
  });

  factory Common.fromJson(Map<String, dynamic> json) {
    return Common(
      errorMessage: json['errorMessage'],
      countPerPage: json['countPerPage'],
      totalCount: json['totalCount'],
      errorCode: json['errorCode'],
      currentPage: json['currentPage'],
    );
  }
}

class Juso {
  String detBdNmList, engAddr, rn;
  String emdNm, zipNo, roadAddrPart2;
  String emdNo, sggNm, jibunAddr;
  String siNm, roadAddrPart1, bdNm;
  String admCd, udrtYn, lnbrMnnm;
  String roadAddr, lnbrSlno, buldMnnm;
  String bdKdcd, liNm, rnMgtSn;
  String mtYn, bdMgtSn, buldSlno;

  Juso({
    required this.detBdNmList,
      required this.engAddr,
      required this.rn,
      required this.emdNm,
      required this.zipNo,
      required this.roadAddrPart2,
      required this.emdNo,
      required this.sggNm,
      required this.jibunAddr,
      required this.siNm,
      required this.roadAddrPart1,
      required this.bdNm,
      required this.admCd,
      required this.udrtYn,
      required this.lnbrMnnm,
      required this.roadAddr,
      required this.lnbrSlno,
      required this.buldMnnm,
      required this.bdKdcd,
      required this.liNm,
      required this.rnMgtSn,
      required this.mtYn,
      required this.bdMgtSn,
      required this.buldSlno
  });

  factory Juso.fromJson(Map<String, dynamic> json) {
    return Juso(
      detBdNmList: json["detBdNmList"],
      engAddr: json["engAddr"],
      rn: json["rn"],
      emdNm: json["emdNm"],
      zipNo: json["zipNo"],
      roadAddrPart2: json["roadAddrPart2"],
      emdNo: json["emdNo"],
      sggNm: json["sggNm"],
      jibunAddr: json["jibunAddr"],
      siNm: json["siNm"],
      roadAddrPart1: json["roadAddrPart1"],
      bdNm: json["bdNm"],
      admCd: json["admCd"],
      udrtYn: json["udrtYn"],
      lnbrMnnm: json["lnbrMnnm"],
      roadAddr: json["roadAddr"],
      lnbrSlno: json["lnbrSlno"],
      buldMnnm: json["buldMnnm"],
      bdKdcd: json["bdKdcd"],
      liNm: json["liNm"],
      rnMgtSn: json["rnMgtSn"],
      mtYn: json["mtYn"],
      bdMgtSn: json["bdMgtSn"],
      buldSlno: json["buldSlno"],
    );
  }
}
