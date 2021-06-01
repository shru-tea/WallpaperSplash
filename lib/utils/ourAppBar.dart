import 'package:flutter/material.dart';
import 'package:wallpaper_app/utils/constants.dart';

Widget appTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Wallpaper',
        style: kTitlePartOne,
      ),
      Text(
        'Splash',
        style: kTitlePartTwo,
      )
    ],
  );
}
