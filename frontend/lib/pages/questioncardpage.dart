import 'package:flutter/material.dart';
import 'package:frontend/models/Question.dart';
import 'package:frontend/models/user.dart';

class QuestionCardPage extends StatelessWidget {
  final List<Question> questions;
  final List<User> users;

  QuestionCardPage({required this.questions, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        User? user;

        try {
          user = users.firstWhere((user) => user.id == question.userId);
        } catch (e) {
          user = null; // User not found
        }

        return ListTile(
          title: Text(question.text),
          subtitle: user != null
              ? Text('Asked by ${user.name}')
              : const Text('User not found'),
        );
      },
    );
  }
}
