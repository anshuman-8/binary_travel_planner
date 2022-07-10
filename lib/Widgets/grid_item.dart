import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GridItem extends StatelessWidget {
  final String title;
  VoidCallback onTap;

  GridItem({Key? key, required this.title, required this.onTap})
      : super(key: key);
  // const GridItem({Key? key}) : super(key: key);

  // static String url =
  //     "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNDQ3NzF8MHwxfHNlYXJjaHwxfHxGcmVlenlDb2xkeSUyMGJlYWNofGVufDB8MHx8fDE2NTczNDUzMTY&ixlib=rb-1.2.1&q=80&w=1080";

  static Future<String> getImage(String title) async {
    List<String> query = title.split(' ');
    String img = "";
    final apiUrl = Uri.parse(
        "https://api.unsplash.com/search/photos?client_id=-eHjWU-F74unXUORuVEvOiGuo070nu6wT_fK9wB7oG4&query=${query[query.length - 1]} beach&page=1&per_page=1&orientation=landscape");

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
    return FutureBuilder(
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
                padding: const EdgeInsets.all(30.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(snapshot.data.toString()).image)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(title),
              ),
            ),
          );
        }
        return Center(
          child: Container(
            child: CircularProgressIndicator(),
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
          ),
        );
      },
    );
  }
}
