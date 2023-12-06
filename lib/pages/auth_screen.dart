import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jasarumahku/pages/home_screen.dart';
import 'package:jasarumahku/pages/login_or_register_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user has logged in
          if (snapshot.hasData) {
            return HomePage();
          }

          //user has NOT logged in
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
