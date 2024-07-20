import 'package:flutter/material.dart';
import '../../components/neubox.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 25),
          child: NeuBox(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Welcome to eduSynergy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Welcome to eduSynergy, your ultimate companion in the journey of learning and education. Our app is designed to bring a new level of synergy between students and educators, and transforming traditional educational methods into an interactive and engaging experience.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    "assets/logo/Woman.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
