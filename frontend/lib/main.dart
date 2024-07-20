import 'package:flutter/material.dart';
import 'package:frontend/pages/about.dart';
import 'package:frontend/pages/coursepage.dart';
import 'package:frontend/pages/historypage.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/leaderboard.dart';
import 'package:frontend/pages/profilepage.dart';
import 'package:frontend/pages/verificationpage.dart';

void main() {
  runApp(const EduSynergy());
}

class EduSynergy extends StatefulWidget {
  const EduSynergy({super.key});

  @override
  State<EduSynergy> createState() => _EduSynergyState();
}

class _EduSynergyState extends State<EduSynergy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/profile': (context) => const Profilepage(),
        '/home': (context) => const Home(),
        '/verification': (context) => const VerificationPage(),
        '/courses': (context) => const CoursesPage(),
        '/history': (context) => const HistoryPage(),
        '/leaderboard': (context) => const Leaderboard(),
        '/about': (context) => const About(),
      },
      home: const Home(),
    );
  }
}
