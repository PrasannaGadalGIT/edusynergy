import 'package:flutter/material.dart';
import 'package:frontend/pages/feedback_pages.dart';
import 'package:frontend/pages/intropages/contact_support_page.dart';
import 'package:frontend/state/font_size_adjustment.dart';
import 'package:provider/provider.dart';
import 'package:frontend/state/theme_provider.dart';
import 'package:frontend/pages/faq_page.dart'; // Import FAQ page
// Import feedback page

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Settings
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            subtitle: const Text('Change profile picture and details'),
            onTap: () {
              // Navigate to profile settings
            },
          ),

          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Password'),
            subtitle: const Text('Change your password'),
            onTap: () {
              // Navigate to password change
            },
          ),

          // Notification Settings
          ExpansionTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            children: [
              SwitchListTile(
                title: const Text('Push Notifications'),
                value: true, // Replace with actual value
                onChanged: (bool value) {
                  // Handle push notifications toggle
                },
              ),
              SwitchListTile(
                title: const Text('Email Notifications'),
                value: true, // Replace with actual value
                onChanged: (bool value) {
                  // Handle email notifications toggle
                },
              ),
            ],
          ),

          // App Preferences
          ExpansionTile(
            leading: const Icon(Icons.settings),
            title: const Text('App Preferences'),
            children: [
              ListTile(
                title: const Text('Theme'),
                subtitle: Text(
                  themeProvider.isDarkMode
                      ? 'Switch to Light Mode'
                      : 'Switch to Dark Mode',
                ),
                onTap: () {
                  themeProvider.toggleTheme();
                },
              ),
              ListTile(
                title: const Text('Font Size'),
                subtitle: const Text('Adjust the font size'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FontSizeAdjustment(),
                    ),
                  );
                },
              ),
            ],
          ),

          // Help & Support
          ExpansionTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            children: [
              ListTile(
                title: const Text('FAQ'),
                subtitle: const Text('Frequently Asked Questions'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FAQPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Contact Support'),
                subtitle: const Text('Get in touch with support'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactSupportPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Feedback'),
                subtitle: const Text('Give us your feedback'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackPage(),
                    ),
                  );
                },
              ),
            ],
          ),

          // Logout and Delete Account
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever),
            title: const Text('Delete Account'),
            onTap: () {
              // Handle account deletion
            },
          ),
        ],
      ),
    );
  }
}
