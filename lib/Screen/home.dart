import 'package:binary_travel_planner/Model/binary_tree.dart';
import 'package:binary_travel_planner/Screen/choose_plan.dart';
import 'package:binary_travel_planner/Screen/travel_planner.dart';
import 'package:flutter/material.dart';
import '../Widgets/grid_item.dart' as grid_item;
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/services.dart';
// import 'package:animated_background/animated_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                      label: const Text("Create")),
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
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 18, 101, 70),
                Color.fromARGB(255, 28, 67, 70),
                Color.fromARGB(255, 7, 41, 69),
                // Color.fromARGB(255, 28, 67, 70),
                // Color.fromARGB(255, 18, 101, 70)
              ]
                  //     colors: [
                  //   Color.fromARGB(255, 201, 119, 46),
                  //   Color.fromARGB(255, 171, 93, 30),
                  //   Color.fromARGB(194, 121, 77, 16)
                  // ]
                  )),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //     height: 150,
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             image: Image.network(
                //                     "https://spng.subpng.com/20190419/xif/kisspng-vector-graphics-computer-icons-illustration-portab-icono-imagen-avion-png-www-imagenesmy-com-5cb9d6bf7f0b19.2585224415556830075204.jpg")
                //                 .image))),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      BinaryTree.tripList.isEmpty
                          ? null
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ChoosePlan())));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange[800],
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        // primary: Colors.purple,

                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 29, fontWeight: FontWeight.w700)),
                    child: const Text(
                      "Plan Your Journey",
                      // style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange[800],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      createBinaryPlan(context);
                    },
                    child: const Text("Make Binary Travel Plan")),
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () async {
                    // final apiUrl = Uri.parse("https://www.google.com/maps");
                    await launch("https://www.google.com/maps");
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Google_Maps_icon_%282015-2020%29.svg/1200px-Google_Maps_icon_%282015-2020%29.svg.png")
                                .image)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
