import 'dart:async';
import 'package:flutter/material.dart';
import '../../style.dart';

class ImageNetwork extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const ImageNetwork(
      {super.key, required this.imageUrl, this.width, this.height});

  @override
  State<StatefulWidget> createState() => _ImageNetworkState();
}

class _ImageNetworkState extends State<ImageNetwork> {
  Size? _imageSize;

  @override
  void initState() {
    super.initState();
    getImageSize();
  }

  void getImageSize() {
    Completer<Size> completer = Completer<Size>();
    Image.network(widget.imageUrl)
        .image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) =>
            completer.complete(Size(
                info.image.width.toDouble(), info.image.height.toDouble()))));
    completer.future.then((size) => setState(() => _imageSize = size));
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(widget.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(),
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? _imageSize?.height);
  }
}

class ContainerOverlay extends StatelessWidget {
  final double? width;
  final EdgeInsets? padding;
  final Widget child;
  final Color? color;

  const ContainerOverlay({
    super.key,
    this.width,
    this.padding,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
          color: color ?? Colors.black.withOpacity(0.5)),
      child: FractionallySizedBox(
        child: child,
      ),
    );
  }
}

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key, String? title})
      : super(
      key: key,
      title: Text('Tourism & Co.'.toUpperCase(), style: Styles.appBarTitle),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0.5);
}