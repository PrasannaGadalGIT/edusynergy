import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<User> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Sample data
    List<User> users = [
      User(
          name: 'Alice Johnson',
          points: 987,
          photoUrl: 'https://via.placeholder.com/50'),
      User(
          name: 'Bob Smith',
          points: 1204,
          photoUrl: 'https://via.placeholder.com/50'),
      User(
          name: 'Charlie Brown',
          points: 760,
          photoUrl: 'https://via.placeholder.com/50'),
      User(
          name: 'Diana Prince',
          points: 1420,
          photoUrl: 'https://via.placeholder.com/50'),
      User(
          name: 'Ethan Hunt',
          points: 980,
          photoUrl: 'https://via.placeholder.com/50'),
      User(
          name: 'Fiona Gallagher',
          points: 1135,
          photoUrl: 'https://via.placeholder.com/50'),
      User(
          name: 'George Washington',
          points: 1100,
          photoUrl: 'https://via.placeholder.com/50'),
      User(
          name: 'Hannah Montana',
          points: 850,
          photoUrl: 'https://via.placeholder.com/50'),
    ];

    // Sort users by points in descending order
    users.sort((a, b) => b.points.compareTo(a.points));

    if (mounted) {
      setState(() {
        _users = users;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text('${index + 1}. ${user.name}'),
                      ),
                      Text('${user.points} points'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class User {
  final String name;
  final int points;
  final String photoUrl;

  User({required this.name, required this.points, required this.photoUrl});
}
