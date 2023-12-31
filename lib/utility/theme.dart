import 'package:flutter/material.dart';

const kTextColor = Colors.black;
const kTextInvertColor = Colors.white;

const kMainColor = Color.fromRGBO(74, 222, 128, 1);
const kMainRichKidColor = Color.fromRGBO(22, 101, 52, 1);
const kSubColor = Color.fromRGBO(163, 230, 53, 1);
const kSubZeroColor = Color.fromRGBO(255, 247, 237, 1);

const kBackgroundLinearMainSubColor = LinearGradient(
    colors: [kMainColor, kSubColor],
    stops: [0.3, 0.9],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight);
const kBackgroundTransparentSubZeroColor = Color.fromRGBO(255, 247, 237, 0.7);
const kBackgroundMainColor = Color.fromRGBO(22, 101, 52, 0.7);

const kMainPadding = EdgeInsets.only(top: 1, bottom: 1, left: 5, right: 5);

const kGreen50 = Color.fromRGBO(240, 253, 244, 1);
const kGreen50o6 = Color.fromRGBO(240, 253, 244, 0.6);
const kGreen100 = Color.fromRGBO(220, 252, 231, 1);
const kGreen400 = Color.fromRGBO(48, 191, 102, 1.0);
const kGreen600 = Color.fromRGBO(22, 163, 74, 1);
const kGreen800 = Color.fromRGBO(22, 101, 52, 1);
const kGreen800o9 = Color.fromRGBO(22, 101, 52, 0.9);
const kGreen950 = Color.fromRGBO(5, 46, 22, 1);
const kRed600 = Color.fromRGBO(220, 38, 38, 1);
const kWhite = Colors.white;
const kBlack = Colors.black;

const kGradientGreen50White = LinearGradient(
    colors: [kGreen50, kWhite],
    stops: [0, 0.7],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight);

const kGradientGreen100White = LinearGradient(
    colors: [kGreen100, kWhite],
    stops: [0, 0.7],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight);
