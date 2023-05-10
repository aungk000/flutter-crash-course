import 'package:flutter/material.dart';
import 'webview.dart';

class WebViewHome extends StatelessWidget {
  final _urls = ['https://www.google.com', 'https://www.youtube.com', 'https://psa.re'];

  WebViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web View'),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _urls.map((url) => _urlButton(context, url)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _urlButton(BuildContext context, String url) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewContainer(url: url),
            ),
          );
        },
        child: Text(url),
      ),
    );
  }
}
