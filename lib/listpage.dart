import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';

class listpage extends StatefulWidget {
  const listpage({super.key});

  @override
  State<listpage> createState() => _listpageState();
}

class _listpageState extends State<listpage> {
  final List<Color> containerColors = [
    const Color.fromARGB(255, 119, 187, 122),
    const Color.fromARGB(255, 151, 79, 163),
    Colors.yellow,
    const Color.fromARGB(255, 223, 159, 154),
    Colors.orange,
    Colors.blue,
    const Color.fromARGB(255, 199, 178, 202),
    Colors.green,
    const Color.fromARGB(255, 211, 146, 141),
    const Color.fromARGB(255, 233, 225, 235),
    Colors.purple,
    const Color.fromARGB(255, 247, 241, 188),
    const Color.fromARGB(255, 253, 227, 187),
    Colors.red,
  ];
  var mybox = Hive.box('mybox');

  List ls = [];
  List _list = [];
  void gtdata() {
    setState(() {
      if (mybox.get(2) != null) {
        setState(() {
          ls = mybox.get(2);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gtdata();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 9,right: 6),
            height: double.infinity,
            width: double.infinity,
            child: MasonryGridView.builder(
              itemCount: ls.length,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                _list = ls[index]['description'];
                return Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      // color: Colors.green[50],
                      color: containerColors[index],
                      //  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ls[index]['title'].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                      Container(
                        height: 100,
                        child: Expanded(
                            child: ListView.builder(
                          itemCount: _list.length,
                          itemBuilder: (context, index) {
                            return Text(_list[index].toString(),
                                style: TextStyle(
                                    // fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    letterSpacing: 1));
                          },
                        )),
                      )
                    ],
                  ),
                );
              },
            )));
  }
}
