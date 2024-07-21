import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class QuestionService {
  static const _sampleQuestions = [
    {
      'id': 'q1',
      'text': 'What is the best way to learn Flutter?',
    },
    {
      'id': 'q2',
      'text': 'How can I improve my Dart skills?',
    },
    {
      'id': 'q3',
      'text': 'What are the benefits of using state management in Flutter?',
    },
    {
      'id': 'q4',
      'text': 'How do I handle network requests in Flutter?',
    },
  ];

  // Initialize with static sample questions if none are present
  Future<void> _initializeSampleQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final existingQuestions = prefs.getStringList('questions') ?? [];

    if (existingQuestions.isEmpty) {
      final sampleQuestionsJson =
          _sampleQuestions.map((q) => jsonEncode(q)).toList();
      await prefs.setStringList('questions', sampleQuestionsJson);
    }
  }

  // Method to submit a question to local storage
  Future<void> submitQuestion(String questionText, String questionId) async {
    await _initializeSampleQuestions(); // Ensure sample questions are initialized
    final prefs = await SharedPreferences.getInstance();
    final questions = prefs.getStringList('questions') ?? [];

    final newQuestion = {
      'id': questionId,
      'text': questionText,
    };

    questions.add(jsonEncode(newQuestion));
    await prefs.setStringList('questions', questions);
  }

  // Method to fetch questions from local storage
  Future<List<Map<String, dynamic>>> fetchQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    await _initializeSampleQuestions(); // Ensure sample questions are initialized
    final questions = prefs.getStringList('questions') ?? [];

    return questions
        .map((question) => jsonDecode(question) as Map<String, dynamic>)
        .toList();
  }

  // Method to fetch question details from local storage
  Future<Map<String, dynamic>> fetchQuestionDetails(String questionId) async {
    final questions = await fetchQuestions();

    return questions.firstWhere((question) => question['id'] == questionId);
  }
}
