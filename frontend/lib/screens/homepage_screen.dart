import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:frontend/screens/question_card.dart';
import 'package:frontend/state/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    _submitQuestion(); // Call the _submitQuestion function here
  }

  Future<void> _submitQuestion() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/userInteraction/postData/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      setState(() {
        questions = data['data'].cast<Map<String, dynamic>>();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final questionData = questions[index];
          return QuestionCard(
            userName: questionData['username'] ?? 'no username',
            question: questionData['content'] ?? 'no content',
            questionId: questionData['postId'] ?? "no post id",
          );
        },
      ),
    );
  }
}