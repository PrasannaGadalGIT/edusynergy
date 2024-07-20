import 'package:flutter/material.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Support'),
        automaticallyImplyLeading: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'If you have any issues or need assistance, please reach out to us:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Email: support@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: +1 234 567 890',
              style: TextStyle(fontSize: 16),
            ),
            // Add more contact details here
          ],
        ),
      ),
    );
  }
}
