import 'package:binary_travel_planner/Model/binary_tree.dart';
import 'package:flutter/material.dart';

class TripPlan extends StatefulWidget {
  // const TripPlan({Key? key}) : super(key: key);
  final BinaryNode? root;
  TripPlan(this.root);

  @override
  State<TripPlan> createState() => _TripPlanState();
}

class _TripPlanState extends State<TripPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 60,
          ),
          Divider(),
          SizedBox(height: 10,),
          
        ],
      ),
    );
  }
}
