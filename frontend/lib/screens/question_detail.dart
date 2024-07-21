import 'package:flutter/material.dart';
import 'package:frontend/models/Question.dart';
import 'package:frontend/models/user.dart';

class QuestionDetailScreen extends StatelessWidget {
  final Question question;
  final User user;

  const QuestionDetailScreen({
    required this.question,
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Details'),
        backgroundColor: const Color(0xff0C0440),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              question.text,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your answer here...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle answer submission
              },
              child: const Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
