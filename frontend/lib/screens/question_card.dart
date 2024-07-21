import 'package:flutter/material.dart';
import 'package:frontend/pages/comment.dart'; // Correct the import path if needed
import 'package:frontend/screens/question_detail_screen.dart'; // Import the QuestionDetailScreen
import 'package:frontend/state/post_provider.dart';
import 'package:provider/provider.dart';

class QuestionCard extends StatelessWidget {
  final String questionId;
  final String userName;
  final String question;

  const QuestionCard({
    Key? key,
    required this.questionId,
    required this.userName,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: ExpansionTile(
          title: Row(
            children: [
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
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Comment(postId: postProvider.postId), // Correctly pass postId here
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.question_answer,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Answer",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Hello"),
            ),
          ],
        ),
      ),
    );
  }
}
