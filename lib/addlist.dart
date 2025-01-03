// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Addlist extends StatefulWidget {
  const Addlist({super.key});

  @override
  State<Addlist> createState() => _AddlistState();
}

class _AddlistState extends State<Addlist> {
  final TextEditingController content = TextEditingController();
  final TextEditingController title = TextEditingController();
  var mybox = Hive.box('mybox');
  List ls = [];
  List _list = [];
  Map mp = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 82, 182, 85),
        title: Text(
          "Add New List",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (mybox.get(2) == null) {
                  mp = {"title": title.text, "description": _list};
                  ls.add(mp);
                  mybox.put(2, ls);
                } else {
                  ls = mybox.get(2);
                  mp = {"title": title.text, "description": _list};
                  ls.add(mp);
                  mybox.put(2, ls);
                }
                title.clear();

                print(_list);
              },
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 80,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    controller: title,
                    cursorColor: const Color.fromARGB(255, 82, 182, 85),
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 82, 182, 85),
                            fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: const Color.fromARGB(255, 82, 182, 85))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 82, 182, 85)))),
                  )),
            ),
            SizedBox(
              height: 80,
              // color: Colors.pink,
              child: Expanded(
                  child: TextField(
                controller: content,
                // maxLines: 30,
                cursorColor: const Color.fromARGB(255, 82, 182, 85),
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Add to list",
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 82, 182, 85),
                      fontSize: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: const Color.fromARGB(255, 82, 182, 85))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 82, 182, 85))),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _list.add(content.text);
                            content.clear();
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: const Color.fromARGB(255, 82, 182, 85),
                          size: 30,
                        ))),
              )),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _list[index].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          _list.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.close)),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
