import 'package:flutter/material.dart';

class LinkedListBlock extends StatelessWidget {
  // const LinkedListBlock({Key? key}) : super(key: key);
  final String title;
  LinkedListBlock(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$title"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_forward_outlined),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
