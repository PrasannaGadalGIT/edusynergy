import 'package:flutter/material.dart';
import 'package:frontend/components/navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EduSynergy',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Times New Roman', fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0C0440),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(),
      drawer: Navbar(),
    );
  }
}
