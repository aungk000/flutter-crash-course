import 'package:flutter/material.dart';

class ImageLocation extends StatelessWidget {
  const ImageLocation({
    super.key,
    required this.url,
    this.width,
    this.height
  });
  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var imageWidth = 0.0;
    var imageHeight = 0.0;

    if(width == null) {
      imageWidth = MediaQuery.of(context).size.width;
    }

    if(height == null) {
      imageHeight = MediaQuery.of(context).size.height;
    }

    if (url.isNotEmpty) {
      try {
        return Container(
            constraints: BoxConstraints.expand(height: height),
            child: Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(),
            )
        );
      } catch (e) {
        print("$e: $url");
        return Container();
      }
    } else {
      return Container();
    }
  }
}