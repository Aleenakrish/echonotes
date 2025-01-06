// import 'dart:math';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  // final List<Color> containerColors = [
  //   const Color.fromARGB(255, 199, 178, 202),
  //   Colors.yellow,
  //   const Color.fromARGB(255, 152, 167, 180),
  //   Colors.orange,
  //   const Color.fromARGB(255, 173, 216, 252),
  //   const Color.fromARGB(255, 233, 225, 235),
  //   Colors.purple,
  //   const Color.fromARGB(255, 119, 187, 122),
  //   const Color.fromARGB(255, 211, 146, 141),
  //   const Color.fromARGB(255, 247, 241, 188),
  //   const Color.fromARGB(255, 223, 159, 154),
  //   Colors.green,
  //   const Color.fromARGB(255, 253, 227, 187),
  //   Colors.red,
  //   const Color.fromARGB(255, 151, 79, 163),
  //   Colors.blue,
  // ];
  var mybox = Hive.box('mybox');

  List ls = [];
  List li = [];

  void getdata() {
    setState(() {
      if (mybox.get(2) != null) {
        setState(() {
          ls = mybox.get(2);
        });
      }
    });
  }

  // Timer? _timer;

  // void tmer() {
  //   _timer = Timer.periodic(
  //     Duration(seconds: 2),
  //     (timer) {
  //       setState(() {
  //         getdata();
  //       });
  //     },
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    // tmer();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(15, (index) => 'Item ${index + 1}');
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 7, right: 7),
            height: double.infinity,
            width: double.infinity,
            child: MasonryGridView.builder(
              itemCount: ls.length,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                li = ls[index]['description'];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "readlistpage",
                        arguments: index.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: containerColors[index],
                        color: Colors.green[100],

                        //  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(
                            //   width: 1,
                            // ),
                            Text(
                              ls[index]['title'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 1),
                            ),

                            PopupMenuButton<String>(
                              onSelected: (String value) {
                                print('Selected: $value');
                              },
                              itemBuilder: (BuildContext context) {
                                return [""].map((String option) {
                                  return PopupMenuItem<String>(
                                      value: option,
                                      child: Column(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                
                                              },
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  ls.removeAt(index);
                                                });
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ))
                                        ],
                                      ));
                                }).toList();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 100,
                          child: Expanded(
                              child: ListView.builder(
                            itemCount: li.length,
                            itemBuilder: (context, index) {
                              return Text(li[index].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      letterSpacing: 1));
                            },
                          )),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
        //  Center(child: Text("list"),),
        );
  }
}
