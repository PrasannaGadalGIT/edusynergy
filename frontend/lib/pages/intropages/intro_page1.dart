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
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 25),
          child: SingleChildScrollView(
            child: NeuBox(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Welcome to eduSynergy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.indigo, // Adjust text color if needed
                        ),
                      ),
                      const SizedBox(height: 10), // Space between title and text
                      const Text(
                        "Welcome to eduSynergy, your ultimate companion in the journey of learning and education. Our app is designed to bring a new level of synergy between students and educators, and transforming traditional educational methods into an interactive and engaging experience.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black, // Adjust text color if needed
                        ),
                        // Ensure the text wraps and doesn't overflow
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 25,),
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
          ),
        ),
      ),
    );
  }
}
