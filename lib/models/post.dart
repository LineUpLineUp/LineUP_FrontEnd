import 'package:flutter/material.dart';

class Post {
  final String title;
  final String body;
  final String cost;
  final DateTime startDate;
  final DateTime endDate;

  Post({
    required this.title,
    required this.body,
    required this.cost,
    required this.startDate,
    required this.endDate,
  });

}
