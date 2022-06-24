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
    // print(l)
    return ar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(),
    );
  }
}
