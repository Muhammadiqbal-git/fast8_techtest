import 'package:flutter/material.dart';

const TextStyle header = TextStyle(fontSize: 16);
const TextStyle headerBold =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const TextStyle subHeader = TextStyle(fontSize: 14);
const TextStyle subHeaderBold =
    TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
const TextStyle body = TextStyle(fontSize: 12);
const TextStyle bodyBold = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

double getHeight(BuildContext context, [double percent = 100]) {
  return MediaQuery.of(context).size.height * percent / 100;
}

double getWidth(BuildContext context, [double percent = 100]) {
  return MediaQuery.of(context).size.width * percent / 100;
}
