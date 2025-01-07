import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Readtextpage extends StatefulWidget {
  const Readtextpage({super.key});

  @override
  State<Readtextpage> createState() => _ReadtextpageState();
}

class _ReadtextpageState extends State<Readtextpage> {
  TextEditingController title1 = TextEditingController();
  TextEditingController description = TextEditingController();
  int? i;
  List ls = [];

  var mybox = Hive.box('mybox');
  void getdata() {
    if (mybox.get(3) != null) {
      setState(() {
        ls = mybox.get(3);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    i = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 82, 182, 85),
        title: Center(
          child: Text(
            ls[i!]["title"].toString(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  title1.text = ls[i!]["title"];
                  description.text = ls[i!]["description"];
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: const Color.fromARGB(255, 82, 182, 85),
                        title: Text("Edit"),
                        
                      ),
                      body: Container(
                        height: double.infinity,
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                                child: TextField(
                              controller: title1,
                              cursorColor:
                                  const Color.fromARGB(255, 82, 182, 85),
                              decoration: InputDecoration(
                                  labelText: "Title",
                                  labelStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 82, 182, 85),
                                      fontSize: 20),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: TextField(
                              controller: description,
                              maxLines: 30,
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: "Description",
                                  labelStyle: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "CANCEL",
                                      style: TextStyle(
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      ls[i!]["title"] = title1.text;
                                      ls[i!]["description"] = description.text;
                                      mybox.put(3, ls);
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK",
                                        style: TextStyle(
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.bold)))
                              ],
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
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                ls.removeAt(i!);
                mybox.put(3, ls);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    ls[i!]["description"].toString(),
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 1),
                  )),
            ),
            // Flexible(
            //     child: Container(
            //   alignment: Alignment.center,
            //   padding: EdgeInsets.only(left: 15, right: 15),
            //   height: 90,
            //   child: Row(
            //     // crossAxisAlignment: CrossAxisAlignment.baseline,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,

            //     children: [
            //       // Text(
            //       //   ls[i!]["time"].toString(),
            //       //   style: TextStyle(fontWeight: FontWeight.bold),
            //       // ),
            //       // Text(ls[i!]["date"].toString(),
            //       //     style: TextStyle(fontWeight: FontWeight.bold))
            //     ],
            //   ),
            // ))
          ],
        ),
      ),
    );
  }
}
