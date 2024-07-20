import 'package:flutter/material.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0C0440),
        title: const Text(
          'Reset Password',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  "assets/logo/Eduard.jpg",
                  width: 200,
                  height: 100,
                ),
              ),
              const Text(
                'EduSynergy',
                style: TextStyle(
                  color: Color(0xff0C0440),
                  fontFamily: 'Roboto',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xff0C0440),
                ),
                child: Column(
                  children: [
                    _buildTextField('Email', Icons.email),
                    const SizedBox(height: 20),
                    _buildTextField('New Password', Icons.lock,
                        obscureText: true),
                    const SizedBox(height: 20),
                    _buildTextField('Confirm New Password', Icons.lock,
                        obscureText: true),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Implement your password reset functionality here
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0C0440), Color(0xFFEADDFF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build text fields with consistent styling
  Widget _buildTextField(String hintText, IconData icon,
      {bool obscureText = false}) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon, color: const Color(0xff0C0440)),
          ),
        ),
      ),
    );
  }
}
