import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class category {
  final String id;
  final String title;
  final Color color;

  const category(
      {required this.id,
      required this.title,
      @required this.color = Colors.black});
}
