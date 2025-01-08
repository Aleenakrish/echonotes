import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  TextEditingController ti = TextEditingController();
  TextEditingController ti2 = TextEditingController();
  var mybox = Hive.box('mybox');
  List ls = [];
  List ll = [];
  List llll = [];
  List listl = [];
  @override
  void getdata() {
    if (mybox.get(1) != null) {
      setState(() {
        ls = mybox.get(1);
      });
    }
  }

  Timer? _timer;

  void tmer() {
    _timer = Timer.periodic(
      Duration(milliseconds: 5),
      (timer) {
        // getdata();
        getdata();
        // a();
      },
    );
  }

  void animatedcontainer() {
    ll = List.generate(ls.length, (index) => false);
    ChangeNotifier();
  }

  void toColor() {
    llll = List.generate(ls.length, (index) => false);
  }

  void color() {
    listl = List.generate(ls.length, (index) => false);
    print(listl);
    List o = [];

    try {
      List o = [];
      print(o.length);
      if (mybox.get(11) != null) {
        o = mybox.get(11);
        for (int i = 0; i <= o.length; i++) {
          print(i);
          if (o[i] == true) {
            listl[i] = true;
          }
        }
      }
    } catch (e) {
      print(e);
    }
    print(listl);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    // tmer();
    animatedcontainer();
    toColor();
    color();
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
                try {
                  int day = ls[index]["day"];
                  int month = ls[index]["month"];
                  int year = ls[index]["year"];
                  if (day > DateTime.now().day) {
                    if (month >= DateTime.now().month) {
                      if (year >= DateTime.now().year) {
                        llll[index] = true;
                      }
                    }
                  }
                } catch (e) {
                  print(e);
                }

                //////////////////////////////////////////////////////color////////////////////////////////////////////
                return GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, "readtaskpage",
                    //     arguments: index.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: llll[index]
                            ? listl[index]
                                ? Colors.green[200]
                                : Colors.blue.shade300
                            : const Color.fromARGB(255, 228, 120, 120),
                        borderRadius: BorderRadius.circular(10)),
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
                            IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  ll[index] = !ll[index];
                                });
                              },
                              icon: ll[index]
                                  ? Icon(
                                      Icons.keyboard_arrow_up,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.black,
                                    ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ls[index]["date"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  Text(ls[index]["time"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                ],
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
                                                    ti.text =
                                                        ls[index]["title"];
                                                    ti2.text = ls[index]
                                                        ["description"];
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
                                                          backgroundColor:
                                                              Colors.greenAccent
                                                                  .shade700,
                                                          actions: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  ls[index][
                                                                          "title"] =
                                                                      ti.text;
                                                                  ls[index][
                                                                          "description"] =
                                                                      ti2.text;
                                                                  mybox.put(
                                                                      1, ls);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                icon: Icon(Icons
                                                                    .check))
                                                          ],
                                                        ),
                                                        body: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                  // flex: 1,
                                                                  child:
                                                                      TextField(
                                                                controller: ti,
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
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                2,
                                                                            color: Colors
                                                                                .green)),
                                                                    border: OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.green))),
                                                              )),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        ti2,
                                                                    maxLines:
                                                                        35,
                                                                    cursorColor:
                                                                        Colors
                                                                            .green,
                                                                    decoration: InputDecoration(
                                                                        alignLabelWithHint: true,
                                                                        labelText: "Description",
                                                                        labelStyle: TextStyle(
                                                                          color:
                                                                              Colors.green,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.green)),
                                                                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green))),
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
                                                    mybox.put(1, ls);
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
                        ),
                        ll[index]
                            ? Text(ls[index]['description'].toString(),
                                maxLines: 10,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    letterSpacing: 0))
                            : SizedBox(
                                height: 0,
                              ),
                        ll[index]
                            ? llll[index]
                                ? TextButton(
                                    onPressed: () {
                                      listl[index] = true;
                                      mybox.put(11, listl);
                                    },
                                    child: Text(
                                        listl[index]
                                            ? "completed"
                                            : "Mark as done",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 13)))
                                : Text("Task ended",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13))
                            : SizedBox(
                                height: 1,
                              ),
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
