import 'package:crash_course/pro/view/component/widget1.dart';
import 'package:crash_course/pro/view/component/widget2.dart';
import 'package:crash_course/pro/view/component/widget3.dart';
import 'package:scoped_model/scoped_model.dart';

import '../model/scoped_counter.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final ScopedCounter scopedCounter = ScopedCounter();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ScopedCounter>(
      model: scopedCounter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scoped Model'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Widget1(), Widget2(), Widget3()],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => scopedCounter.increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
