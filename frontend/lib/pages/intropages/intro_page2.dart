import 'package:flutter/material.dart';
import '../../components/neubox.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF283593),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 25),
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
                        height: 30,
                      ),
                      const Text(
                        "Interactive Discussions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.indigo, // Adjust text color if needed
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Space between title and text
                      const Text(
                        "Join and start asking your questions right away",
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
                      const Text(
                        "Become a Mentor",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.indigo, // Adjust text color if needed
                        ),
                      ),
                      const Text(
                        "The more we share, the more we have.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black, // Adjust text color if needed
                        ),
                        // Ensure the text wraps and doesn't overflow
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/logo/Study.png",
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
