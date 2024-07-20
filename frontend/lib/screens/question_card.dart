import 'package:flutter/material.dart';
import 'package:frontend/screens/question_detail_screen.dart'; // Import the QuestionDetailScreen
import 'package:frontend/screens/question_service.dart';

class QuestionCard extends StatelessWidget {
  final String questionId;
  final String profileImageUrl;
  final String userName;
  final String question;

  const QuestionCard({
    Key? key,
    required this.questionId,
    required this.profileImageUrl,
    required this.userName,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionService questionService =
        QuestionService(); // Initialize your service

    return GestureDetector(
      onTap: () async {
        try {
          final questionDetails =
              await questionService.fetchQuestionDetails(questionId);

          if (questionDetails != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionDetailScreen(
                  profileImageUrl: questionDetails['profileImageUrl'] ?? '',
                  userName: questionDetails['userName'] ?? '',
                  question: questionDetails['question'] ?? '',
                  questionDate: questionDetails['questionDate'] != null
                      ? DateTime.parse(questionDetails['questionDate'])
                      : DateTime.now(),
                  answers: List<Map<String, dynamic>>.from(
                      questionDetails['answers'] ?? []),
                ),
              ),
            );
          } else {
            // Handle the case where questionDetails is null
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load question details')),
            );
          }
        } catch (e) {
          // Handle any exceptions
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred: $e')),
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: ExpansionTile(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          subtitle: Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tap to view more details...',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.question_answer,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
