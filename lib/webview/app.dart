import 'package:flutter/material.dart';
import 'view/home.dart';

class WebViewApp extends StatelessWidget {
  const WebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.white, fontSize: 18.0),
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: WebViewHome(),
    );
  }
}