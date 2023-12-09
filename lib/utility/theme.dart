import 'dart:ui';

import 'package:flutter/material.dart';

const kTextColor = Colors.black;
const kTextInvertColor = Colors.white;

const kMainColor = Color.fromRGBO(74, 222, 128, 1);
const kMainRichKidColor = Color.fromRGBO(22, 101, 52, 1);
const kSubColor = Color.fromRGBO(163, 230, 53, 1);
const kSubZeroColor = Color.fromRGBO(255, 247, 237, 1);

const kBackgroundLinearMainSubColor = LinearGradient(colors: [kMainColor, kSubColor], stops: [0.3, 0.9], begin: Alignment.bottomLeft, end: Alignment.topRight);
const kBackgroundTransparentSubZeroColor = Color.fromRGBO(255, 247, 237, 0.7);
const kBackgroundMainColor = Color.fromRGBO(22, 101, 52, 0.7);

const kMainPadding = EdgeInsets.only(top: 1, bottom: 1, left: 5, right: 5);