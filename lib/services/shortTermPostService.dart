
import 'dart:convert';

import 'package:line_up_front_end/models/shortTermPosts.dart';

class shortTermPostService {


  void sendPostToServer(shortTermPosts post) async {
    final serverUrl = '';
    final headers = {'Content-Type': 'application/json'};
    final postJson = jsonEncode(post.toJson());


  }
}