/*import 'package:app_doc/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_doc/login.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Authentication
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  //FirebaseUser user;

  // Storage

  //FirebaseStorage storage = FirebaseStorage.instance;

  // Database

  //Firestore firestore = Firestore.instance;

  // Photo collection

  //PhotoCollection photoCollection = PhotoCollection();

  // Screens

  Widget _currentScreen = LoginScreen();

  // Initialization

  @override
  void initState() {
    super.initState();

    // Check if the user is authenticated
    auth.authStateChanges().listen((event) {
      setState(() {
        user = event;
        // If the user is authenticated, show the main screen

        if (user != null) {
          _currentScreen = HomeScreen();
        } else {
          // If the user is not authenticated, show the login screen
          _currentScreen = LoginScreen();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_doc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _currentScreen,
    );
  }
}
*/