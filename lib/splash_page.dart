import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prefs_341/home_page.dart';
import 'package:prefs_341/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool check = prefs.getBool("login") ?? false;

      Widget navigateTo = LoginPage();


      if (check) {
        navigateTo = HomePage();
      }


      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigateTo,
          ));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
