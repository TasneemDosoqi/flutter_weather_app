import 'package:flutter/material.dart';

const kBigTitleTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  color: Color(0xffFCFCFC),
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
  color: Color(0xffFCFCFC),
);

const kHintTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
  color: Color(0xff504FD3),
);
const kInputTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
  color: Colors.black,
);

const kConstTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 15.0,
  color: Colors.black,
);
const kNumberTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w500,
  fontSize: 30.0,
  color: Colors.black,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);


BoxShadow containerShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    offset: Offset(0, 3),
    spreadRadius: 5,
    blurRadius: 7,
  );
}

