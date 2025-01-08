// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  TextEditingController ti = TextEditingController();
  TextEditingController ti2 = TextEditingController();
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
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
                        color: Colors.green[100],
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
                                                setState(() {
                                                  ti.text = ls[index]["title"];
                                                  li = ls[index]["description"];
                                                });

                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return Scaffold(
                                                      appBar: AppBar(
                                                        iconTheme:
                                                            IconThemeData(
                                                                color: Colors
                                                                    .white),
                                                        title: Text("Edit",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)),
                                                        backgroundColor: Colors
                                                            .greenAccent
                                                            .shade700,
                                                        actions: [
                                                          IconButton(
                                                              onPressed: () {
                                                                ls[index][
                                                                        "title"] =
                                                                    ti.text;
                                                                ls[index][
                                                                    "description"] = li;
                                                                mybox.put(
                                                                    2, ls);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: Icon(
                                                                  Icons.check))
                                                        ],
                                                      ),
                                                      body: Container(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.all(15),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 80,
                                                              child: Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        ti,
                                                                    cursorColor:
                                                                        Colors
                                                                            .green,
                                                                    decoration: InputDecoration(
                                                                        labelText:
                                                                            "Title",
                                                                        labelStyle: TextStyle(
                                                                            color: Colors
                                                                                .green,
                                                                            fontSize:
                                                                                20),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.green)),
                                                                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              height: 80,
                                                              // color: Colors.pink,
                                                              child: Expanded(
                                                                  child:
                                                                      TextField(
                                                                controller: ti2,
                                                                // maxLines: 30,
                                                                cursorColor:
                                                                    Colors
                                                                        .green,
                                                                decoration: InputDecoration(
                                                                    alignLabelWithHint: true,
                                                                    labelText: "Description",
                                                                    labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.green)),
                                                                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                                                                    suffixIcon: IconButton(
                                                                        onPressed: () {
                                                                          setState(
                                                                              () {
                                                                            li.add(ti2.text);
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            li.add(ti2.text);
                                                                            ti2.clear();
                                                                            print(li);
                                                                          });
                                                                        },
                                                                        icon: Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              Colors.green,
                                                                          size:
                                                                              30,
                                                                        ))),
                                                              )),
                                                            ),
                                                            Expanded(
                                                                child: ListView
                                                                    .builder(
                                                              itemCount:
                                                                  li.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return ListTile(
                                                                  title: Text(
                                                                    li[index]
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                  trailing:
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              li.removeAt(index);
                                                                            });
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.close)),
                                                                );
                                                              },
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
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
                                                  mybox.put(2, ls);
                                                  Navigator.pop(context);
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
                          height: 80,
                          child: Expanded(
                              child: ListView.builder(
                            itemCount: li.length,
                            itemBuilder: (context, index) {
                              return Text(li[index].toString(),
                                  // maxLines: 10,
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
        );
  }
}
