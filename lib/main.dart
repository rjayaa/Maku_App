import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maku_app/home.dart';
import 'package:maku_app/otp.dart';
import 'package:maku_app/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      routes: {
        'phone': (context) => LoginScreen(),
        'otp': (context) => MyOtp(),
        'home': (context) => MyHome(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;

          if (user == null) {
            // User is not logged in, navigate to phone verification page
            return LoginScreen();
          } else {
            // User is logged in, navigate to home page
            return MyHome();
          }
        } else {
          // Handle loading state if needed
          return CircularProgressIndicator();
        }
      },
    );
  }
}
