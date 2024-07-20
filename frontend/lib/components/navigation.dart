import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pop(context); // Close the drawer after selection

    // Navigate to the specific page based on index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/profile'); // Example route
        break;
      case 1:
        Navigator.pushNamed(context, '/home'); // Example route
        break;
      case 2:
        Navigator.pushNamed(context, '/verification'); // Example route
        break;
      case 3:
        Navigator.pushNamed(context, '/courses'); // Example route
        break;
      case 4:
        Navigator.pushNamed(context, '/history'); // Example route
        break;
      case 5:
        Navigator.pushNamed(context, '/leaderboard'); // Example route
        break;
      case 6:
        Navigator.pushNamed(context, '/about'); // Example route
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xff0C0440),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90, // Define a specific height for the image
                    child: Image.asset('assets/logo/Eduard.jpg'),
                  ),
                  const SizedBox(
                      height: 10), // Add some space between image and text
                  const Text(
                    'EduSynergy',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman'),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('Edit Profile',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Roboto')),
              tileColor:
                  _selectedIndex == 0 ? Colors.blue.withOpacity(0.1) : null,
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('Home',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Roboto')),
              tileColor:
                  _selectedIndex == 1 ? Colors.blue.withOpacity(0.1) : null,
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(
                Icons.verified,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('Verification',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Roboto')),
              tileColor:
                  _selectedIndex == 2 ? Colors.blue.withOpacity(0.1) : null,
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: const Icon(
                Icons.book,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('Courses',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Roboto')),
              tileColor:
                  _selectedIndex == 3 ? Colors.blue.withOpacity(0.1) : null,
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('History',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Roboto')),
              tileColor:
                  _selectedIndex == 4 ? Colors.blue.withOpacity(0.1) : null,
              onTap: () => _onItemTapped(4),
            ),
            ListTile(
              leading: const Icon(
                Icons.leaderboard,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('LeaderBoard',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Roboto')),
              tileColor:
                  _selectedIndex == 5 ? Colors.blue.withOpacity(0.1) : null,
              onTap: () => _onItemTapped(5),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('About Us',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Roboto')),
              tileColor:
                  _selectedIndex == 6 ? Colors.blue.withOpacity(0.1) : null,
              onTap: () => _onItemTapped(6),
            ),
          ],
        ),
      ),
    );
  }
}
