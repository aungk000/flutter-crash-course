import 'package:flutter/cupertino.dart';

import '../model/user.dart';
import 'package:flutter/material.dart';

class HomeCupertino extends StatefulWidget {
  const HomeCupertino({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeCupertinoState();
  }
}

class _HomeCupertinoState extends State<HomeCupertino> {
  final user = User();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Forms'),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CupertinoTextField(placeholder: 'Enter first name',),
                const CupertinoTextField(placeholder: 'Enter last name',),
                CupertinoButton(
                    onPressed: () {
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        user.save();
                        _showValid(context);
                      }
                    },
                    child: const Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showValid(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Form saved'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    ));
  }
}
