import 'package:flutter/material.dart';
import 'package:ziemart_frontend/view/pages/homepage.dart';
import 'package:ziemart_frontend/view/pages/registerPage.dart';
import 'package:ziemart_frontend/view/pages/splashPage.dart';
import 'package:ziemart_frontend/view/pages/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Example',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/registerPage': (context) => const RegisterPage(),
        '/loginPage': (context) => const LoginPage(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}