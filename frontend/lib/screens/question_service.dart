import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/screens/question_card.dart';
class QuestionService {
  final String _baseUrl = 'http://127.0.0.1:8000/'; // Replace with your API URL

  // Method to fetch questions from the backend
  Future<List<Map<String, dynamic>>> fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/userInteraction/postData/'));
      print(response.body); // For debugging

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final List<dynamic> data = responseData['data'] ?? [];
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load questions. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle and throw exception if there are any errors
      throw Exception('Failed to fetch questions: $e');
    }
  }

  // Method to fetch details for a specific question

}
