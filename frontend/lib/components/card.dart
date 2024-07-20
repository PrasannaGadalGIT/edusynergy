import 'package:flutter/material.dart';

class UserInteractionCard extends StatelessWidget {
  const UserInteractionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => MyItem(index),
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({required this.cardName});

  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/logo/eduard.png',
                height: 40,
                width: 40,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Student_name"), Text("Role")],
            ),
          ]),
          Container(
            height: 200,
            color: const Color(0xffFAFAFA),
            padding: const EdgeInsets.all(20),
            child: const TextField(
              maxLines: null, // Allow the field to expand to multiple lines
              minLines: 5, // Set the minimum number of lines to 5
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Question',
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(right: 20, top: 15),
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/icon/eduard.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final int index;

  const MyItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(32.0), // Add 32 pixels of padding on all sides
      child: const Card(
        child: _PostCard(cardName: 'Elevated Card'),
      ),
    );
  }
}
