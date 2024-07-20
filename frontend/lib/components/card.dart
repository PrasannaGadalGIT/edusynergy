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
        Divider(height: 1),
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
          Row(
            children : [
              Container(

              padding: EdgeInsets.all(20),
              child: Container(
                  child: Image.asset('assets/logo/profilephoto.png', height: 40, width: 40,)),
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Student_name"),
                  Text("Role")
                ],
              )



            ]
          ),

          Container(
            height: 200,
            color: Color(0xffFAFAFA),
            padding: EdgeInsets.all(20),
            child: TextField(
              maxLines: null, // Allow the field to expand to multiple lines
              minLines: 5, // Set the minimum number of lines to 5
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Question',
              ),
            )
          ),
          GestureDetector(

              child : Container(
            padding: EdgeInsets.only(right: 20, top: 15),
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/icon/comment.png'),
          ))
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
    return Container(
      padding: EdgeInsets.all(32.0), // Add 16 pixels of padding on all sides
      child: Card(
        child: _PostCard(cardName: 'Elevated Card'),
      ),
    );
  }
}