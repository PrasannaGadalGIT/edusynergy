import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart'; // Import from the same file

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Predefined sample data
    final List<User> users = [
      User(id: 'u1', name: 'Alice Johnson', points: 987),
      User(id: 'u2', name: 'Bob Smith', points: 1204),
      User(id: 'u3', name: 'Charlie Brown', points: 760),
      User(id: 'u4', name: 'Diana Prince', points: 1420),
      User(id: 'u5', name: 'Ethan Hunt', points: 980),
      User(id: 'u6', name: 'Fiona Gallagher', points: 1135),
      User(id: 'u7', name: 'George Washington', points: 1100),
      User(id: 'u8', name: 'Hannah Montana', points: 850),
    ];

    // Check for null values and ensure no User has null points
    // ignore: unused_local_variable
    // for (var user in users) {}

    // Sort users by points in descending order
    // users.sort((a, b) => b.points.compareTo(a.points));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text('${index + 1}. ${user.name}'),
            subtitle: Text('${user.points} points'),
          );
        },
      ),
    );
  }
}
