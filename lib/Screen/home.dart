import 'package:binary_travel_planner/Screen/travel_planner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void createBinaryPlan(BuildContext ctx) {
    TextEditingController title = TextEditingController();
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
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
                  padding: EdgeInsets.all(9),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        print(title.text);
                        title.text != ""
                            ? Navigator.push(
                                ctx,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TravelPlannerPage(title.text)),
                              )
                            : null;
                      },
                      icon: Icon(Icons.navigate_next_outlined),
                      label: Text("Add")),
                )
              ],
            ),
          );
        });
    TravelPlannerPage("sdf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                createBinaryPlan(context);
              },
              child: const Text("Make Binary Travel Plan")),
          SizedBox(
            width: 23,
          ),
          ElevatedButton(
              onPressed: () {}, child: const Text("Choose a travel plan"))
        ],
      ),
    ));
  }
}
