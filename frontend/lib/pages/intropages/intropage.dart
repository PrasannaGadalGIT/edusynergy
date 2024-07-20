import 'package:flutter/material.dart';
import 'package:frontend/pages/intropages/intro_page1.dart';
import 'package:frontend/pages/intropages/intro_page2.dart';
import 'package:frontend/pages/intropages/intro_page3.dart';
import 'package:frontend/pages/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();

  bool onLastPage = false;
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
                onFirstPage = (index == 0);
              });
            },
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Prev
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: onFirstPage
                      ? const SizedBox(width: 60) // Placeholder for alignment
                      : GestureDetector(
                          onTap: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Text(
                            'Prev',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),

                // Dots
                SmoothPageIndicator(controller: _controller, count: 3),

                // Next
                GestureDetector(
                  onTap: () {
                    if (onLastPage) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    onLastPage ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
