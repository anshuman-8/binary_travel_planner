import 'package:binary_travel_planner/Model/binary_tree.dart';
import 'package:binary_travel_planner/Screen/choose_plan.dart';
import 'package:binary_travel_planner/Screen/home.dart';
import 'package:binary_travel_planner/Screen/travel_planner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      routes: {
        '/choose-plan': (context) => ChoosePlan(),
        // '/travel-planner':(context)=>TravelPlannerPage("", BinaryNode root),
      },
    );
  }
}
