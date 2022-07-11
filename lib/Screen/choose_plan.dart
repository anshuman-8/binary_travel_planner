import 'package:binary_travel_planner/Model/linkedList.dart';
import 'package:binary_travel_planner/Widgets/linked_list_block.dart';
import 'package:flutter/material.dart';
import '../Model/linkedList.dart';
import '../Model/binary_tree.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({Key? key}) : super(key: key);

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  // const ChoosePlan({Key? key}) : super(key: key);
  bool _choose = false;
  BinaryNode? _curnode;
  LinkedList? _l;

  List<Widget> displayTrips() {
    List<Map<BinaryNode, String>> li = BinaryTree.tripList;
    List<Widget> ans = [];
    for (var element in li) {
      // print(element.keys.first.data);
      ans.add(Padding(
        padding: const EdgeInsets.all(9),
        child: GridItem(
          title: element.keys.first.data,
          onTap: () {
            tripChoosen(element.keys.first);
          },
        ),
      ));
    }
    return ans;
  }

  Widget _tripBlocks() {
    List<Widget> ans = [
      const SizedBox(
        width: 20,
      )
    ];
    for (String a in _l!.list) {
      ans.add(LinkedListBlock(a));
    }
    return Row(children: [...ans]);
  }

  Future<void> tripChoosen(BinaryNode root) async {
    BinaryNode curNode = root;
    LinkedList li = LinkedList();
    Node node = Node(curNode.data);
    li.add(node);
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
    await finalChoose(curNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: _choose == true ? _tripBlocks() : Container(),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child:
                  Text("Choose a Trip Theme", style: TextStyle(fontSize: 29)),
            ),
            Container(
                height: MediaQuery.of(context).size.height - 200,
                padding: const EdgeInsets.fromLTRB(20, 30, 30, 30),
                child: SingleChildScrollView(
                  child: GridView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4.7 / 3, crossAxisCount: 3),
                    children: [...displayTrips()],
                    // itemBuilder: (context, index) {
                    //   return displayTrips()[index];
                    // },
                  ),
                )
                // _choose == true
                //     ? Container()
                //     : Column(
                //         children: [...displayTrips()],
                //       )
                ),
          ],
        ),
      ),
    );
  }

  Future<void> optionChooser(BinaryNode node) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _curnode = node.left;
                        });
                        _curnode = node.left;
                        Navigator.of(context).pop();
                        return;
                      },
                      child: Text(
                        node.left!.data,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _curnode = node.right;
                        });
                        Navigator.of(context).pop();
                        return;
                      },
                      child: Text(
                        node.right!.data,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  )
                ],
              ));
        });
  }

  Future<void> finalChoose(BinaryNode node) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Text(
                "Congratulations 🎊,Your next destination is ${node.data}",
                style: const TextStyle(fontSize: 23),
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      "Yeah!",
                      style: TextStyle(fontSize: 18),
                    )),
              )
            ],
          );
        });
  }
}

//---------------------------------------------------------....-----------------------------------------------------
class GridItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const GridItem({Key? key, required this.title, required this.onTap})
      : super(key: key);
  // const GridItem({Key? key}) : super(key: key);

  // static String url =
  //     "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNDQ3NzF8MHwxfHNlYXJjaHwxfHxGcmVlenlDb2xkeSUyMGJlYWNofGVufDB8MHx8fDE2NTczNDUzMTY&ixlib=rb-1.2.1&q=80&w=1080";

  static Future<String> getImage(String title) async {
    // List<String> query = title.split(" ");
    String query = title;
    String img = "";
    // print("parse object: ${query[query.length - 1]}");
    final apiUrl = Uri.parse(
        "https://api.unsplash.com/search/photos?client_id=-eHjWU-F74unXUORuVEvOiGuo070nu6wT_fK9wB7oG4&query=${query}&page=1&per_page=1");

    var result = await http.get(apiUrl);
    var jsonData = await json.decode(result.body);
    var data = await jsonData["results"];
    img = await data[0]["urls"]["regular"];
    print("image: " + img);
    return img;
    // return img;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: FutureBuilder(
        future: getImage(title),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 39, 101, 104),
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Stack(children: [
              // bottom: 10,
              // height: 50,
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(snapshot.data.toString()).image),
                ),
                // child: Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   // child: Text(title),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 170, 0, 10),
                child: Container(
                  height: 30,
                  width: 220,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(246, 198, 224, 240),
                    Color.fromARGB(218, 196, 221, 229),
                    Color.fromARGB(185, 231, 226, 226),
                    Color.fromARGB(38, 255, 255, 255)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              )
            ]);
          }
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 39, 101, 104),
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
