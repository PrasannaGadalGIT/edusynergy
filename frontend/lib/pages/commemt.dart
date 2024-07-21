import 'dart:convert';
import 'package:frontend/state/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:frontend/state/comment_provider.dart';
import 'package:provider/provider.dart';

class Comment extends StatelessWidget {
  final String postId;
  final TextEditingController _commentController = TextEditingController();

  Comment({required this.postId, Key? key}) : super(key: key);

  void commentData(BuildContext context) {
    final comment = _commentController.text;
    Provider.of<CommentProvider>(context, listen: false).setComment(comment);
  }

  Future<void> _commentAnswer(String userId) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/userInteraction/comment/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'comment': _commentController.text,
          'userId': userId,
          'postId': postId,
        }),
      );
      if (response.statusCode == 200) {
        print('Comment submitted successfully');
      } else {
        print('Failed to submit comment');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userId = authProvider.userId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Leave your comment below:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your comment here',
              ),
              controller: _commentController,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                commentData(context);
                if (userId != null) {
                  _commentAnswer(userId);
                } else {
                  print('User is not logged in');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

}
