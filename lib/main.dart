import 'package:flutter/material.dart';
import 'package:maku_app/otp.dart';
import 'package:maku_app/phone.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone': (context) => MyPhone(),
      'otp': (context) => MyOtp(),
    },
  ));
}
