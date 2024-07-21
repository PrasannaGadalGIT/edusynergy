import 'package:frontend/pages/question_service.dart';

void submitQuestion(String questionText) async {
  final questionService = QuestionService();
  final questionId = DateTime.now().toIso8601String(); // Use a unique ID

  try {
    await questionService.submitQuestion(questionText, questionId);
    print('Question submitted successfully');
  } catch (e) {
    print('Failed to submit question: $e');
  }
}
