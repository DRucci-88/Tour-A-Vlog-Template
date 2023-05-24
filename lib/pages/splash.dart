import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:touravelog/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamed(context, '/onboarding'),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamed(context, '/bottomNavigation'),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash/App Logo Inspiraton 132.png",
                height: size.height * 0.12,
                width: size.height * 0.12,
              ),
              const Text(
                "Touravelog",
                style: bold60white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
