import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionService {
  final String _baseUrl =
      'https://your-api-url.com'; // Replace with your API URL

  // Method to submit a question to the backend
  Future<void> submitQuestion(String questionText) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/questions'), // Adjust the endpoint as needed
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': questionText}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to submit question');
    }
  }

  // Method to fetch questions from the backend
  Future<List<Map<String, dynamic>>> fetchQuestions() async {
    final response = await http.get(Uri.parse('$_baseUrl/questions'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }

  fetchQuestionDetails(String questionId) {}
}
