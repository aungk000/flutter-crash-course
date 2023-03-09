import 'package:flutter/material.dart';

import '../../style.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key, String? title})
      : super(
            key: key,
            title:
                Text('Tourism & Co.'.toUpperCase(), style: Styles.appBarTitle),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            elevation: 0.5);
}
