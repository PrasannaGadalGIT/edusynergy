import 'package:flutter/material.dart';

import '../../components/neubox.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303F9F),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 25),
          child: SingleChildScrollView(
            child: NeuBox(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 25, right: 25, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Let's Get Started!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.indigo, // Adjust text color if needed
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Space between title and text
                      const Text(
                        "We’re excited to have you with us on this journey. Let’s dive in and unlock the full potential of learning together. Welcome aboard—let’s get started on this exciting adventure!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black, // Adjust text color if needed
                        ),
                        // Ensure the text wraps and doesn't overflow
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/logo/door.png",
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
