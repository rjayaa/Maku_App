import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maku_app/home.dart';
import 'package:maku_app/otp.dart';
import 'package:maku_app/phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone': (context) => MyPhone(),
      'otp': (context) => MyOtp(),
      'home': (context) => MyHome(),
    },
  ));
}
// t7xrBdEWN3M8AfzDDnWDO9hi2BJ2