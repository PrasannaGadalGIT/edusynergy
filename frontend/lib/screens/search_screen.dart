import 'package:flutter/material.dart';
import 'package:frontend/models/Question.dart';
import 'package:frontend/models/user.dart'; // Import from the same file
import 'package:frontend/screens/question_detail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Question> _allQuestions = [
    Question(
        id: 'q1', userId: 'u1', text: 'What is the best way to learn Flutter?'),
    Question(id: 'q2', userId: 'u2', text: 'How can I improve my Dart skills?'),
    Question(
        id: 'q3',
        userId: 'u3',
        text: 'What are the benefits of using state management in Flutter?'),
    Question(
        id: 'q4',
        userId: 'u4',
        text: 'How do I handle network requests in Flutter?'),
  ];

  final List<User> _allUsers = [
    User(id: 'u1', name: 'Alice', points: 1000),
    User(id: 'u2', name: 'Bob', points: 1000),
    User(id: 'u3', name: 'Charlie', points: 1000),
    User(id: 'u4', name: 'David', points: 1000),
  ];

  List<Question> _filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    _filteredQuestions = _allQuestions;
    _searchController.addListener(() {
      _filterQuestions();
    });
  }

  void _filterQuestions() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredQuestions = _allQuestions
          .where((question) => question.text.toLowerCase().contains(query))
          .toList();
    });
  }

  User _getUserById(String userId) {
    return _allUsers.firstWhere(
      (user) => user.id == userId,
      orElse: () => User(
        id: 'unknown',
        name: 'Unknown',
        points: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Questions'),
        backgroundColor: const Color(0xff0C0440),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _filteredQuestions.length,
              itemBuilder: (context, index) {
                final question = _filteredQuestions[index];
                final user = _getUserById(question.userId);

                return ListTile(
                  title: Text(question.text),
                  subtitle: Text('Asked by ${user.name}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionDetailScreen(
                          question: question,
                          user: user,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
