import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            title: Text('How do I reset my password?'),
            subtitle: Text(
                'You can reset your password by going to the Password Reset page in the Settings.'),
          ),
          ListTile(
            title: Text('How can I contact support?'),
            subtitle: Text(
                'You can contact support through the Contact Support page.'),
          ),
          // Add more FAQ items here
        ],
      ),
    );
  }
}
