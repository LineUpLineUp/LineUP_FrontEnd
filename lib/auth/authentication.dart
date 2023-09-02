import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class Authentication{
  void authenticateWithNaver() async {
    final clientState = "test";
    final clientId = "B_92M4CV3XEimJYDRlDj";
    final authUri = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'response_type': 'code',
      'client_id': clientId,
      'response_mode': 'form_post',
      'redirect_uri': 'https://test.hyunwoo.tech/login/oauth2/code/naver',
      'state': clientState,
    });
    final authResponse = await FlutterWebAuth2.authenticate(
        url: authUri.toString(),
        callbackUrlScheme: "lineup"
    );
    final code = Uri.parse(authResponse).queryParameters['code'];

    // 이제 인증 코드를 백엔드 서버로 전송하거나 다른 작업을 수행할 수 있습니다.
    print("Received code: $code");
  }
}

