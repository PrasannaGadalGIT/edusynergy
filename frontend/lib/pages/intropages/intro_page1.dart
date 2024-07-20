import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      body: Container(
        alignment: Alignment.center,
        child: Text('Welcome to the first page', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}