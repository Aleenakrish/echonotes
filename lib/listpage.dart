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
    return Scaffold(
        body: Container(
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
                      
                      //  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

                      borderRadius: BorderRadius.circular(15)),
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
                                fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w500,
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
