import 'package:flutter/material.dart';

class Bottomnav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Bottomnav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff0C0440),
      currentIndex: currentIndex,
      onTap: (index) {
        if (index >= 0 && index < 5) {
          // Ensure index is within valid range
          onTap(index);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home), // Icon for Home
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Ask',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      selectedFontSize: 16,
      unselectedFontSize: 14,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
      ),
    );
  }
}
