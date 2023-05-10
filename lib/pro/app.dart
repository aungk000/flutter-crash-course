import 'package:crash_course/pro/model/scoped_counter.dart';
import 'package:crash_course/pro/view/home.dart';
import 'package:flutter/material.dart';

class ProApp extends StatelessWidget {
  const ProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}