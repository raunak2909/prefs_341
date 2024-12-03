import 'package:flutter/material.dart';
import 'package:prefs_341/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              /// if authentication is successful

              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("login", true);


              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            child: Text("Login")),
      ),
    );
  }
}
