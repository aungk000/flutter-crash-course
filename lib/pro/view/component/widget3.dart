import 'package:crash_course/pro/model/scoped_counter.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Widget3 extends StatelessWidget {
  const Widget3({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedCounter>(
        builder: (context, child, model) =>
            Text('Widget3 counter is ${model.counter3.count}'));
  }
}
