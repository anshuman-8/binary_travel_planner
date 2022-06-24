import 'package:flutter/material.dart';

import '../Model/binary_tree.dart';

class BranchAdder extends StatelessWidget {
  String title;
  String leftS;
  String rightS;

  BranchAdder(this.title, this.leftS, this.rightS, {Key? key})
      : super(key: key);

  TextEditingController left = TextEditingController();
  TextEditingController right = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Column(
          children: [
            Text(title),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Option 1 for $title',
                  hintText: 'eg. Munnar',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Option 2 for $title',
                  hintText: 'eg. Goa',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(9),
              child: ElevatedButton.icon(
                  onPressed: () {
                    if (left.text.trim() != "" || right.text.trim() != "") {
                      leftS = left.text;
                      rightS = right.text;
                      print(leftS + " - " + rightS);
                    }
                  },
                  icon: Icon(Icons.navigate_next_outlined),
                  label: Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}
