import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;

  const WebViewContainer({super.key, required this.url});

  @override
  State<StatefulWidget> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
    /*..setBackgroundColor(Colors.black12)
    ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) { // update loading bar },
        onPageStarted: (url) {},
        onPageFinished: (url) {},
        onWebResourceError: (error) {},
        onNavigationRequest: (request) {
          if (request.url.startsWith('https://www.youtube.com')) {
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
        }));*/
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    _controller.loadRequest(Uri.parse(widget.url));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: _controller,
              key: _key,
            ),
          ),
        ],
      ),
    );
  }
}
