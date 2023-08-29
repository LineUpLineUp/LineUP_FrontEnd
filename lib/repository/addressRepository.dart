import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../models/location.dart';

class AddressRepository{
  final logger = Logger();

  Future<Address> searchAddress(String query) async{
    Uri apiUrl = Uri.parse("http://www.juso.go.kr/addrlink/addrLinkApi.do$query");

    Response response = await get(apiUrl);
    String bodyString = utf8.decode(response.bodyBytes);
    Map<String, dynamic> body = jsonDecode(bodyString);
    logger.d(body);

    return Address.formJson(body);
  }
}