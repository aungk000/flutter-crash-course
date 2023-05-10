import 'package:flutter/material.dart';

import 'view/location_list.dart';

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LocationList(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
