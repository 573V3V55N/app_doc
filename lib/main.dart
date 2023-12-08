import 'dart:ffi';

import 'package:app_doc/features/user_auth/presentation/ResetPassword.dart';
import 'package:app_doc/features/app/splash_screen/splash_screen.dart';
import 'package:app_doc/features/user_auth/firebase_auth_implementation/firebase_options.dart';
import 'package:app_doc/home.dart';
import 'package:app_doc/features/user_auth/presentation/login.dart';
import 'package:app_doc/features/user_auth/presentation/login_email.dart';
import 'package:app_doc/features/user_auth/presentation/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:app_doc/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final FirebaseAuth auth = FirebaseAuth.instance;
  Widget _currentScreen = LoginScreen();

// Verificar si el usuario está logueado
  User? user = auth.currentUser;

  if (user != null) {
    // El usuario está logueado
    _currentScreen = HomeScreen();
    print("El usuario está logueado con el ID ${user.uid}");
  } else {
    // El usuario no está logueado
    _currentScreen = LoginScreen();
    print("El usuario no está logueado");
  }
  runApp(MyApp(_currentScreen));
}

class MyApp extends StatelessWidget {
  Widget _currentScreen = LoginScreen();
  MyApp(Widget currentScreen) {
    _currentScreen = currentScreen;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Doc',
      //Tema Principal, se usa cuando no está activo el modo oscuro
      theme: ThemeData(
        //Se indica que el tema tiene un brillo luminoso/claro
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        secondaryHeaderColor: const Color.fromRGBO(255, 193, 7, 1),
      ),
      //Tema Oscuro, se usa cuando se activa el modo oscuro
      darkTheme: ThemeData(
        //Se indica que el tema tiene un brillo oscuro
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/': (context) => SplashScreen(
            // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
            child: _currentScreen),
        '/login': (context) => LoginScreen(),
        '/login-email': (context) => LoginEmailScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/resetPassword': (context) => ResetPasswordScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
