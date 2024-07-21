import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/state/post_provider.dart';
import 'package:http/http.dart' as http;
import '../pages/home.dart';
import 'question_service.dart'; // Ensure correct import
import 'package:frontend/state/auth_provider.dart';
import 'package:frontend/state/post_provider.dart';
import 'package:provider/provider.dart';
class AskScreen extends StatefulWidget {
  const AskScreen({super.key});

  @override
  _AskScreenState createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  final TextEditingController _controller = TextEditingController();
  final QuestionService _questionService = QuestionService();


  Future<void> _submitQuestion() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final userId = authProvider.userId;
    final questionText = _controller.text;
    final username = authProvider.username;
    if(questionText.isNotEmpty){
        try{
          final response = await http.post(
            Uri.parse('http://127.0.0.1:8000/userInteraction/ask/'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              'userId' : userId,
              'content' : questionText,
              'username' : username

            }),
          );



          if(jsonDecode(response.body)['questionSent']){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          }
        }catch(e){
          print(e);
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
