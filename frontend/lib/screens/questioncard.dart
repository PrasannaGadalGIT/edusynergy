import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String userName;
  final String questionText;

  QuestionCard(
      {required this.userName,
      required this.questionText,
      required String profileImageUrl,
      required String question,
      required String questionId});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              questionText,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
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
