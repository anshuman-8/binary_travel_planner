import 'package:flutter/material.dart';

import '../Model/binary_tree.dart';

class ChoosePlan extends StatefulWidget {
  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  // const ChoosePlan({Key? key}) : super(key: key);
  bool _choose = false;

  List<Widget> displayTrips() {
    List<Map<BinaryNode, String>> li = BinaryTree.tripList;
    List<Widget> ans = [];
    li.forEach((element) {
      print(element.keys.first.data);
      ans.add(Padding(
        padding: EdgeInsets.all(9),
        child: ElevatedButton(
          child: Text("${element.keys.first.data}"),
          onPressed: () {},
        ),
      ));
    });
    return ans;
  }

  void tripChoosen(BinaryNode root) {
    BinaryNode curNode=root;
    setState(() {
      _choose = true;
    });
    while (true) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 150, vertical: 80),
          child: _choose == true
              ? Container()
              : ListView(
                  children: [...displayTrips()],
                )),
    );
  }
}
