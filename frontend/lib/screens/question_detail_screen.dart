import 'package:flutter/material.dart';

class QuestionDetailScreen extends StatefulWidget {
  final String profileImageUrl;
  final String userName;
  final String question;
  final DateTime questionDate;
  final List<Map<String, dynamic>> answers;

  const QuestionDetailScreen({
    required this.profileImageUrl,
    required this.userName,
    required this.question,
    required this.questionDate,
    this.answers = const [], // Default to an empty list if not provided
    Key? key,
  }) : super(key: key);

  @override
  _QuestionDetailScreenState createState() => _QuestionDetailScreenState();
}

class _QuestionDetailScreenState extends State<QuestionDetailScreen> {
  final TextEditingController _answerController = TextEditingController();

  void _addAnswer() {
    if (_answerController.text.isNotEmpty) {
      setState(() {
        widget.answers.add({
          'text': _answerController.text,
          'date': DateTime.now(),
        });
        _answerController.clear(); // Clear the text field
      });
    }
  }

  void _deleteAnswer(int index) {
    setState(() {
      widget.answers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Details'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.profileImageUrl),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.question,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Question posted on: ${widget.questionDate.toLocal()}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: widget.answers.isEmpty ? 1 : widget.answers.length,
              itemBuilder: (context, index) {
                if (widget.answers.isEmpty) {
                  return Center(
                    child: Text(
                      'No answers yet.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }
                final answerMap = widget.answers[index];
                final answer = answerMap['text'] as String? ?? 'No answer';
                final answerDate =
                    answerMap['date'] as DateTime? ?? DateTime.now();
                return AnswerCard(
                  answer: answer,
                  dateTime: answerDate,
                  onDelete: () => _deleteAnswer(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _answerController,
                    decoration: InputDecoration(
                      labelText: 'Your answer...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addAnswer,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation based on the selected item
        },
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String answer;
  final DateTime dateTime;
  final VoidCallback onDelete;

  const AnswerCard({
    required this.answer,
    required this.dateTime,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Answer:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    answer,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Answered on: ${dateTime.toLocal().year}/${dateTime.toLocal().month}/${dateTime.toLocal().day} ${dateTime.toLocal().hour}:${dateTime.toLocal().minute}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
