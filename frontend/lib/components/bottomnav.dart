import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _currentIndex = 0; // Initial index set to 0

  List<Widget> body = const [
    Icon(Icons.person),
    Icon(Icons.person),
    Icon(Icons.person),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xff0C0440),
        currentIndex: _currentIndex, // Set the current index here
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Ask',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard,
            ),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Setting',
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
      ),
    );
  }
}
