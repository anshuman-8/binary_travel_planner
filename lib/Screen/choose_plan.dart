import 'package:binary_travel_planner/Model/linkedList.dart';
import 'package:binary_travel_planner/Widgets/linked_list_block.dart';
import 'package:flutter/material.dart';
import '../Model/linkedList.dart';
import '../Model/binary_tree.dart';

class ChoosePlan extends StatefulWidget {
  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  // const ChoosePlan({Key? key}) : super(key: key);
  bool _choose = false;
  BinaryNode? _curnode;
  LinkedList? _l;

  void _onSelect(BinaryNode root) {
    LinkedList list = new LinkedList();
    setState(() {
      _choose = true;
    });
    BinaryNode root;
  }

  List<Widget> displayTrips() {
    List<Map<BinaryNode, String>> li = BinaryTree.tripList;
    List<Widget> ans = [];
    li.forEach((element) {
      print(element.keys.first.data);
      ans.add(Padding(
        padding: EdgeInsets.all(9),
        child: ElevatedButton(
          child: Text("${element.keys.first.data}"),
          onPressed: () {
            tripChoosen(element.keys.first);
          },
        ),
      ));
    });
    return ans;
  }

  Widget _tripBlocks() {
    List<Widget> ans = [];
    for (String a in _l!.list) {
      ans.add(Text(
        "$a",
        style: TextStyle(fontSize: 20),
      ));
    }
    return Row(children: [...ans]);
  }

  Future<void> tripChoosen(BinaryNode root) async {
    BinaryNode curNode = root;
    LinkedList li = LinkedList();
    setState(() {
      _choose = true;
      _l = li;
    });
    while (curNode.left != null || curNode.right != null) {
      await optionChooser(curNode);
      Node? n = Node(_curnode!.data);
      li.add(n);
      curNode = _curnode as BinaryNode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 120,
            child: _choose == true ? _tripBlocks() : Container(),
          ),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 80),
              child: Column(
                children: [...displayTrips()],
              )
              // _choose == true
              //     ? Container()
              //     : Column(
              //         children: [...displayTrips()],
              //       )
              ),
        ],
      ),
    );
  }

  Future<void> optionChooser(BinaryNode node) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return Container(
            child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                content: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: ElevatedButton(
                        onPressed: () {
                          _curnode = node.left as BinaryNode?;
                          Navigator.of(context).pop();
                          return;
                        },
                        child: Text("${node.left!.data}"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: ElevatedButton(
                        onPressed: () {
                          _curnode = node.right as BinaryNode?;
                          Navigator.of(context).pop();
                          return;
                        },
                        child: Text("${node.right!.data}"),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
