import 'package:flutter/material.dart';
import 'package:frontend/components/bottomnav.dart';
import 'package:frontend/components/navigation.dart';
import 'package:frontend/screens/homepage_screen.dart';
import 'package:frontend/screens/search_screen.dart';
import 'package:frontend/screens/leaderboard_screen.dart';
import 'package:frontend/screens/settings_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Default to the Home tab

  final List<Widget> _screens = [
    const HomepageScreen(), // Home screen
    const SearchScreen(), // Search screen
    const LeaderboardScreen(), // Leaderboard screen
    const SettingsScreen(), // Settings screen
  ];

  void _onTabSelected(int index) {
    if (index >= 0 && index < _screens.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EduSynergy',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Times New Roman', fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0C0440),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _screens[_currentIndex], // Ensure the correct screen is shown
      bottomNavigationBar: Bottomnav(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
      drawer: const Navbar(), // Ensure the Navbar component is correct
    );
  }
}
