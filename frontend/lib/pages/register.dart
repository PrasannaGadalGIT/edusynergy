import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0C0440),
        title: const Text(
          'Register',
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
                    _buildTextField('Username'),
                    const SizedBox(height: 20),
                    _buildTextField('Email'),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedRole,
                            hint: const Text('Select Role'),
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Color(0xff0C0440)),
                            style: const TextStyle(color: Color(0xff0C0440)),
                            items: <String>['Student', 'Educator']
                                .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(value),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRole = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField('Password', obscureText: true),
                    const SizedBox(height: 20),
                    _buildTextField('Confirm Password', obscureText: true),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Implement your register functionality here
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
                            "Register",
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
  Widget _buildTextField(String hintText, {bool obscureText = false}) {
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
            prefixIcon: hintText == 'Username'
                ? const Icon(Icons.person, color: Color(0xff0C0440))
                : hintText == 'Email'
                    ? const Icon(Icons.email, color: Color(0xff0C0440))
                    : hintText == 'Password' || hintText == 'Confirm Password'
                        ? const Icon(Icons.lock, color: Color(0xff0C0440))
                        : null,
          ),
        ),
      ),
    );
  }
}
