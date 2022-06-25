import 'package:binary_travel_planner/Model/binary_tree.dart';
import 'package:flutter/material.dart';

import '../Widgets/branch_adder.dart';

class TravelPlannerPage extends StatefulWidget {
  final String title;
  TravelPlannerPage(this.title);

  @override
  State<TravelPlannerPage> createState() => _TravelPlannerPageState();
}

class _TravelPlannerPageState extends State<TravelPlannerPage> {
  List<String> askChildren() {
    var ar = new List.filled(2, "", growable: false);
    String l = "";
    String r = "";
    BranchAdder(widget.title, l, r);
    return ar;
  }

  static List<List<BinaryNode>> tree = [];

  Widget levelBuilder(List<BinaryNode> li) {
    List<Widget> wl = [];
    li.forEach(((element) {
      wl.add(Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  element.data,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ));
    }));
    return ListView(
      children: [...wl],
    );
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
                    onPressed: () {},
                    icon: Icon(Icons.playlist_add),
                    label: Text("Add Level")),
              ),
              Divider(
                height: 20,
                indent: 130,
                endIndent: 130,
              ),
              Card(
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 430,
                child: ListView.builder(
                  itemCount: tree.length,
                  itemBuilder: (context, index) {
                    return levelBuilder(tree[index]);
                  },
                ),
              ),
              SizedBox(
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
