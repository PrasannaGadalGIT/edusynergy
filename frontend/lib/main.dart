import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:frontend/state/theme_provider.dart'; // Import your ThemeProvider
import 'package:frontend/state/notification_settings_provider.dart'; // Import your NotificationSettingsProvider
import 'package:frontend/pages/about.dart';
import 'package:frontend/pages/coursepage.dart';
import 'package:frontend/pages/historypage.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/intropages/intropage.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/pages/password_reset.dart';
import 'package:frontend/pages/profilepage.dart';
import 'package:frontend/pages/register.dart';
import 'package:frontend/pages/verificationpage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NotificationSettingsProvider()),
      ],
      child: const EduSynergy(),
    ),
  );
}

class EduSynergy extends StatelessWidget {
  const EduSynergy({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          routes: {
            '/profile': (context) => const Profilepage(),
            '/home': (context) => const Home(),
            '/verification': (context) => const VerificationPage(),
            '/courses': (context) => const CoursesPage(),
            '/history': (context) => const HistoryPage(),
            '/about': (context) => const About(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => const Register(),
            '/pass_rest': (context) => const PasswordResetPage(),
          },
          home: const IntroPage(),
        );
      },
    );
  }
}
