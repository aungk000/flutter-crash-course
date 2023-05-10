import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 22.0;
  static const _textSizeDefault = 16.0;
  static const _textSizeSmall = 12.0;
  static const _paddingDefault = 12.0;
  static const _paddingLarge = 16.0;
  static final Color _textColorBold = _hexToColor('000000');
  static final Color _textColorBright = _hexToColor('ffffff');
  static final Color _textColorDefault = _hexToColor('666666');
  static final Color _textColorAccent = Colors.red;
  static final Color _textColorFaint = _hexToColor('999999');
  static final String _fontDefault = 'Montserrat';

  static const paddingLarge = EdgeInsets.all(_paddingLarge);
  static const paddingDefault = EdgeInsets.all(_paddingDefault);

  static final flatButtonStyle = TextButton.styleFrom(
      backgroundColor: _textColorAccent,
      foregroundColor: _textColorBright,
      minimumSize: const Size(double.infinity, 50.0));

  static final titleDark = TextStyle(
      fontFamily: _fontDefault,
      fontSize: _textSizeLarge,
      color: _textColorBright);

  static final titleLight = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: _fontDefault,
      fontSize: _textSizeLarge,
      color: _textColorBold);

  static final subTitleStyle = TextStyle(
      fontSize: _textSizeDefault,
      color: _textColorAccent);

  static final captionStyle = TextStyle(
      fontFamily: _fontDefault,
      fontSize: _textSizeSmall,
      color: _textColorFaint);

  static final appBarTitle = TextStyle(
      fontSize: _textSizeDefault,
      fontFamily: _fontDefault,
      fontWeight: FontWeight.w600,
      color: _textColorBold);

  static final headerLarge = TextStyle(
      fontFamily: _fontDefault,
      fontSize: _textSizeLarge,
      color: _textColorBold);

  static final textDefault = TextStyle(
      fontFamily: _fontDefault,
      fontSize: _textSizeDefault,
      color: _textColorDefault);

  static Color _hexToColor(String hex) {
    return Color(int.parse(hex.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
