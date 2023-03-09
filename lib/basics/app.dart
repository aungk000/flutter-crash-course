import 'package:flutter/material.dart';

import 'data/repository.dart';
import 'view/location_list.dart';
import 'model/location.dart';

class BasicsApp extends StatefulWidget {
  const BasicsApp({super.key});

  @override
  State<StatefulWidget> createState() => _BasicsAppState();
}

class _BasicsAppState extends State<BasicsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LocationList(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
