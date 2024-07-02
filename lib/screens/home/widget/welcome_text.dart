import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        textAlign: TextAlign.center,
        'Find A Perfect Property To Enjoy With Your Family',
        style: TextStyle(
          fontFamily: "Playwrite",
          color: Color(0xFB59CAB6),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
