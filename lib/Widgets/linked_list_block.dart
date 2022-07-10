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
            color: Colors.yellow[700],
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 9.0, horizontal: 13),
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_outlined,
            size: 20,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
