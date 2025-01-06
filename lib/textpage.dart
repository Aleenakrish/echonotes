import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class Textpage extends StatefulWidget {
  const Textpage({super.key});

  @override
  State<Textpage> createState() => _TextpageState();
}

class _TextpageState extends State<Textpage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String? value;
  final List<Color> containerColors = [
    const Color.fromARGB(255, 203, 138, 214),
    const Color.fromARGB(255, 223, 159, 154),
    const Color.fromARGB(255, 119, 187, 122),
    const Color.fromARGB(255, 126, 164, 196),
    const Color.fromARGB(255, 199, 178, 202),
    Colors.yellow,
    const Color.fromARGB(255, 211, 146, 141),
    const Color.fromARGB(255, 252, 173, 55),
    const Color.fromARGB(255, 233, 225, 235),
    Colors.purple,
    const Color.fromARGB(255, 247, 241, 188),
    Colors.green,
    const Color.fromARGB(255, 253, 227, 187),
    const Color.fromARGB(255, 224, 162, 158),
  ];
  var mybox = Hive.box('mybox');
  List ls = [];
  @override
  void getdata() {
    if (mybox.get(3) != null) {
      setState(() {
        ls = mybox.get(3);
      });
    }
  }

  Timer? _timer;

  void tmer() {
    _timer = Timer.periodic(
      Duration(milliseconds: 2),
      (timer) {
        setState(() {
          getdata();
        });
      },
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    tmer();
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
                  onTap: () {
                    Navigator.pushNamed(context, "readtextpage",
                        arguments: index.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: containerColors[index],
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ls[index]['title'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
                                                title.text = ls[index]["title"];
                                                description.text =
                                                    ls[index]["description"];
                                              });
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Scaffold(
                                                    appBar: AppBar(
                                                      iconTheme: IconThemeData(
                                                          color: Colors.white),
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 82, 182, 85),
                                                      title: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      actions: [
                                                        IconButton(
                                                            onPressed: () {
                                                              ls[index][
                                                                      "title"] =
                                                                  title.text;
                                                              ls[index][
                                                                      "description"] =
                                                                  description
                                                                      .text;
                                                              mybox.put(3, ls);
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
                                                          EdgeInsets.all(5),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                              child: TextField(
                                                            controller: title,
                                                            cursorColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    82,
                                                                    182,
                                                                    85),
                                                            decoration: InputDecoration(
                                                                labelText:
                                                                    "Title",
                                                                labelStyle: TextStyle(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        82,
                                                                        182,
                                                                        85),
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
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.green))),
                                                          )),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Expanded(
                                                              child: TextField(
                                                            controller:
                                                                description,
                                                            maxLines: 30,
                                                            cursorColor:
                                                                Colors.green,
                                                            decoration:
                                                                InputDecoration(
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    labelText:
                                                                        "Description",
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color: Colors
                                                                                .green)),
                                                                    border: OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.green))),
                                                          )),
                                                          Container(
                                                            height: 10,
                                                          )
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
                                                ls.removeAt(index!);
                                                mybox.put(3, ls);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))
                                      ],
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(ls[index]['description'].toString(),
                            maxLines: 6,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                letterSpacing: 1))
                      ],
                    ),
                  ),
                );
              },
            ))
        // Center(child: Text("task"),),
        );
  }
}
