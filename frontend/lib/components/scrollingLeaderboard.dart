import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scrollingleaderboard extends StatelessWidget {
  const Scrollingleaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

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

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length];
    final hexRgb = color.shade500.toString().substring(10, 16).toUpperCase();
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
              child: CircleAvatar(

              ),
          )),
      title: Text(' #Teacher${index + 1}'),

    );
  }
}
