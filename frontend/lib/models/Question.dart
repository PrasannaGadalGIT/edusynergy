class Question {
  final String id;
  final String userId;
  final String text;

  Question({required this.id, required this.userId, required this.text});

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      userId: map['userId'],
      text: map['text'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'text': text,
    };
  }
}
