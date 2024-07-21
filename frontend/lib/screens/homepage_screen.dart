import 'package:flutter/material.dart';
import 'package:frontend/screens/questioncard.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  // Example data
  final List<Map<String, String>> questions = [
    {
      'profileImageUrl': 'https://example.com/profile1.jpg',
      'userName': 'John Doe',
      'question': 'What is the best way to learn Flutter?',
      'answer': 'Practice and build real projects.',
    },
    {
      'profileImageUrl': 'https://example.com/profile2.jpg',
      'userName': 'Jane Smith',
      'question': 'How can I improve my Dart skills?',
      'answer': 'Study the official documentation and practice coding.',
    },
    // Add more question data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final questionData = questions[index];
          return QuestionCard(
            profileImageUrl: questionData['profileImageUrl']!,
            userName: questionData['userName']!,
            question: questionData['question']!,
            questionId: '',
            questionText: '',
          );
        },
      ),
    );
  }
}
