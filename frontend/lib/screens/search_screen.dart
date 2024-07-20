import 'package:flutter/material.dart';
import 'package:frontend/screens/question_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allQuestions = [
    'What is the best way to learn Flutter?',
    'How can I improve my Dart skills?',
    'What are the benefits of using state management in Flutter?',
    'How do I handle network requests in Flutter?',
    // Add more questions here
  ];
  List<String> _filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    _filteredQuestions = _allQuestions; // Initialize with all questions
    _searchController.addListener(() {
      _filterQuestions();
    });
  }

  void _filterQuestions() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredQuestions = _allQuestions
          .where((question) => question.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return ListTile(
                  title: Text(question),
                  onTap: () {
                    // Handle navigation or action on question tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionDetailScreen(
                          profileImageUrl: 'https://example.com/profile.jpg',
                          userName: 'User Name',
                          question: question,
                          answers: [
                            {
                              'text': 'Detailed answer for the question.',
                              'date': DateTime.now()
                            }
                          ],
                          questionDate: DateTime.now(),
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
