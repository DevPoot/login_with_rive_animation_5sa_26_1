
import "package:flutter/material.dart";

class login_screen extends StatelessWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: RiveAnimation.asset("assets/animated_login_bear.riv"))
          ],
        ),
      ),
    );
  }
}





