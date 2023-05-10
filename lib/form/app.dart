import 'view/home.dart';
import 'view/home_cupertino.dart';
import 'package:flutter/material.dart';

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms',
      home: FormHome(),
    );
  }
}