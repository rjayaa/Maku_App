import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle user logout
  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      Navigator.of(context).pushReplacementNamed(
          'phone'); // Navigate to phone verification page after logout
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          // Logout button
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(),
          ),
        ],
      ),
      body: Center(
        child: Text("Welcome to the Home Page!"),
      ),
    );
  }
}
