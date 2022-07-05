import 'package:binary_travel_planner/Model/binary_tree.dart';
import 'package:binary_travel_planner/Screen/choose_plan.dart';
import 'package:binary_travel_planner/Screen/travel_planner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void newTrip(BuildContext ctx, String title) {
    BinaryNode node = BinaryNode(null, null, title, 50);
    BinaryTree bn = BinaryTree(node, title);
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => TravelPlannerPage(title, node)),
    );
  }

  void createBinaryPlan(BuildContext ctx) {
    TextEditingController title = TextEditingController();
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: title,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Trip Title',
                      hintText: 'eg. Towards Nature ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        print(title.text);
                        title.text != "" ? (newTrip(ctx, title.text)) : null;
                      },
                      icon: const Icon(Icons.navigate_next_outlined),
                      label: const Text("Add")),
                )
              ],
            ),
          );
        });
    // TravelPlannerPage("sdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // primary: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500)),
              onPressed: () {
                createBinaryPlan(context);
              },
              child: const Text("Make Binary Travel Plan")),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
              onPressed: () {
                BinaryTree.tripList.length == 0
                    ? null
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ChoosePlan())));
              },
              style: ElevatedButton.styleFrom(
                  // primary: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500)),
              child: const Text("Choose a travel plan"))
        ],
      ),
    ));
  }
}
