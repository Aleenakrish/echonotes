import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  final List<Color> containerColors = [
    const Color.fromARGB(255, 233, 225, 235),
    const Color.fromARGB(255, 119, 187, 122),
    Colors.blue,
    const Color.fromARGB(255, 211, 146, 141),
    const Color.fromARGB(255, 199, 178, 202),
    Colors.yellow,
    const Color.fromARGB(255, 152, 167, 180),
    Colors.orange,
    const Color.fromARGB(255, 173, 216, 252),
    Colors.purple,
    const Color.fromARGB(255, 247, 241, 188),
    const Color.fromARGB(255, 223, 159, 154),
    Colors.green,
    const Color.fromARGB(255, 253, 227, 187),
    Colors.red,
    const Color.fromARGB(255, 151, 79, 163),
  ];

  var mybox = Hive.box('mybox');
  List ls = [];
  @override
  void initfun() {
    if (mybox.get(1) != null) {
      setState(() {
        ls = mybox.get(1);
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initfun();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(15, (index) => 'Item ${index + 1}');
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(left: 9, right: 6),
          height: double.infinity,
          width: double.infinity,
          child: MasonryGridView.builder(
            itemCount: ls.length,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 5),
                  decoration: BoxDecoration(
                      color: containerColors[index],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ls[index]['title'].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(ls[index]['description'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              letterSpacing: 1)),
                      Text(ls[index]['date'].toString())
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
