import 'package:crash_course/pro/model/scoped_counter.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Widget1 extends StatelessWidget {
  const Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedCounter>(
        builder: (context, child, model) =>
            Text('Widget1 counter is ${model.counter1.count}'));
  }
}
