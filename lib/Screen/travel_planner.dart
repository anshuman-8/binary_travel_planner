import 'package:binary_travel_planner/Model/binary_tree.dart';
import 'package:flutter/material.dart';

class TravelPlannerPage extends StatefulWidget {
  final String title;
  final BinaryNode root;
  TravelPlannerPage(this.title, this.root);

  @override
  State<TravelPlannerPage> createState() => _TravelPlannerPageState();
}

class _TravelPlannerPageState extends State<TravelPlannerPage> {
  // List<String> askChildren() {
  //   var ar = new List.filled(2, "", growable: false);
  //   String l = "";
  //   String r = "";
  //   BranchAdder(widget.title, l, r);
  //   return ar;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tree.add([widget.root]);
  }

  List<List<BinaryNode>> tree = [];
  // final BinaryNode asd = BinaryNode(null, null, " ", 3);

  Widget levelBuilder(List<BinaryNode> li) {
    //this is for making list for lvl UI display
    List<Widget> wl = [];
    li.forEach(((element) {
      wl.add(Card(
        color: Colors.yellow[600],
        margin: EdgeInsets.symmetric(vertical: 20),
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            element.data,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ));
    }));
    // List<Widget> wli = [];
    // wl.forEach
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [...wl],
      ),
    );
  }

  Future<void> addLevel(List<BinaryNode> oldList) async {
    // used for adding a new row list
    List<BinaryNode> li = [];
    for (var element in oldList) {
      if (element.data.trim() != "") {
        await branchAdder(context, element);
        li.add(element.left!);
        li.add(element.right!);
        // li.add(asd);
      }
    }

    setState(() {
      tree.add(li);
    });
    // tree.forEach((element) {
    //   element.forEach((element1) {
    //     print(element1.data);
    //     print("--------------");
    //   });
    // }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        // primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    onPressed: () => addLevel(tree[tree.length - 1]),
                    icon: Icon(Icons.playlist_add),
                    label: Text("Add Level")),
              ),
              Divider(
                height: 20,
                indent: 130,
                endIndent: 130,
              ),
              // Card(
              //   elevation: 7,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: Text(
              //       widget.title,
              //       style: TextStyle(fontSize: 20),
              //     ),
              //   ),
              // ),
              Container(
                height: 430,
                child: ListView.builder(
                  itemCount: tree.length,
                  itemBuilder: (context, index) {
                    return levelBuilder(tree[index]);
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text("Add more levels by clicking 'Add Level' on top")
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> branchAdder(BuildContext context, BinaryNode node) async {
  TextEditingController leftCtrl = TextEditingController();
  TextEditingController rightCtrl = TextEditingController();
  await showDialog(
      context: context,
      builder: (ctx) {
        return Container(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(node.data),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: leftCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Option 1 for ${node.data}',
                      hintText: 'eg. Munnar',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: rightCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Option 2 for ${node.data}',
                      hintText: 'eg. Goa',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(9),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            if (leftCtrl.text.trim() != "" ||
                                rightCtrl.text.trim() != "") {
                              // leftS = left.text;
                              // rightS = right.text;
                              BinaryNode l = BinaryNode(
                                  null, null, "${leftCtrl.text.trim()}", 23);
                              BinaryNode r = BinaryNode(
                                  null, null, "${rightCtrl.text.trim()}", 28);
                              node.left = l;
                              node.right = r;
                              print(leftCtrl.text + " - " + rightCtrl.text);
                            }
                            ;
                            Navigator.pop(context);
                            return;
                          },
                          icon: Icon(Icons.navigate_next_outlined),
                          label: Text("Add")),
                    ),
                    Padding(
                        padding: EdgeInsets.all(9),
                        child: ElevatedButton.icon(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            label: Text("Cancel")))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
