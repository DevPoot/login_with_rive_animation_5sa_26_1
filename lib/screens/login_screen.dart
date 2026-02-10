import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Evita que se quite espacio del nudge
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RiveAnimation.asset('animated_login_bear.riv')
            )
          ],
        )
      )


    );
  }
}