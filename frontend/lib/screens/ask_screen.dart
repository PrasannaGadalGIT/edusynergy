import 'package:flutter/material.dart';

import 'question_service.dart'; // Ensure correct import

class AskScreen extends StatefulWidget {
  const AskScreen({super.key});

  @override
  _AskScreenState createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  final TextEditingController _controller = TextEditingController();
  final QuestionService _questionService = QuestionService();

  Future<void> _submitQuestion() async {
    final questionText = _controller.text;

    if (questionText.isNotEmpty) {
      try {
        await _questionService.submitQuestion(questionText);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Question submitted successfully')),
        );
        _controller.clear();

        // Optionally redirect to a different page after successful submission
        Navigator.pop(context); // Go back to the previous screen, if applicable
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit question')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask a Question'),
        automaticallyImplyLeading: false, // Ensure this is set correctly
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Ask your question here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitQuestion,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
