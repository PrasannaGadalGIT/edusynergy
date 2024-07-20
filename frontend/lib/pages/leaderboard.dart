import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C0440),
        title: Text(
          "Leaderboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
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
          Divider(height: 1),
        ],
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final int index;

  const MyItem(this.index);

  void topTeacher() {
    if (index == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Container(
        height: 300,
        alignment: Alignment.center,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          leading: Container(
            width: 80,
            height: 80,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              minRadius: 50,

            ),
          ),
          title: Text(' #Teacher${index + 1}'),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xff0C0440),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          leading: AspectRatio(
            aspectRatio: 1,
            child: Container(
              child: CircleAvatar(),
            ),
          ),
          title: Text(
            ' #Teacher${index + 1}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}