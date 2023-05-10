import '../model/user.dart';
import 'package:flutter/material.dart';

class FormHome extends StatefulWidget {
  const FormHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormHomeState();
  }
}

class _FormHomeState extends State<FormHome> {
  final user = User();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'First name'),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter your first name';
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() => user.firstName = val!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last name'),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter your last name';
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() => user.lastName = val!);
                },
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Subscribe'),
              ),
              SwitchListTile(
                title: const Text('Monthly Newsletter'),
                value: user.newsletter,
                onChanged: (val) {
                  setState(() => user.newsletter = val);
                },
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Interests'),
              ),
              CheckboxListTile(
                  title: const Text('Cooking'),
                  value: user.passions['cooking'],
                  onChanged: (val) {
                    setState(() => user.passions['cooking'] = val!);
                  }),
              CheckboxListTile(
                  title: const Text('Hiking'),
                  value: user.passions['hiking'],
                  onChanged: (val) {
                    setState(() => user.passions['hiking'] = val!);
                  }),
              CheckboxListTile(
                  title: const Text('Traveling'),
                  value: user.passions['traveling'],
                  onChanged: (val) {
                    setState(() => user.passions['traveling'] = val!);
                  }),
              ElevatedButton(
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
