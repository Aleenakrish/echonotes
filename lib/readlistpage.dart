import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Readlistpage extends StatefulWidget {
  const Readlistpage({super.key});

  @override
  State<Readlistpage> createState() => _ReadlistpageState();
}

class _ReadlistpageState extends State<Readlistpage> {
  TextEditingController ti = TextEditingController();
  TextEditingController ti2 = TextEditingController();
  int? i;
  List ls = [];
  List li = [];
  List llii = [];
  List<bool> ll = [];
  Map mp = {};
  var mybox = Hive.box('mybox');

  void getdata() {
    if (mybox.get(2) != null) {
      setState(() {
        ls = mybox.get(2);
      });
      try {
        setState(() {
          li = ls[i!]['description'];
        });
        for (int i = 0; i <= li.length; i++) {
          // mp[i]={li[i]:false};
          ll = List.generate(li.length, (index) => false);
        }
      } catch (e) {
        print(e);
      } 
    }
  }

  Timer? _timer;

  void tmer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          getdata();
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    tmer();
  }

  @override
  Widget build(BuildContext context) {
    i = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.greenAccent.shade700,
        title: Center(
            child: Text(ls[i!]['title'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22))),
        actions: [
          // =============================================================================================================================

          IconButton(
            onPressed: () {
              setState(() {
                ti.text = ls[i!]["title"];
                // ti2.text=ls[i!]["description"];
                llii = ls[i!]["description"];
              });

              showDialog(
                context: context,
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      iconTheme: IconThemeData(color: Colors.white),
                      title: Text("Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      backgroundColor: Colors.greenAccent.shade700,
                      actions: [
                        IconButton(
                            onPressed: () {
                              ls[i!]["title"] = ti.text;
                              ls[i!]["description"] = llii;
                              mybox.put(2, ls);
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.check))
                      ],
                    ),
                    body: Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            child: Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: ti,
                                  cursorColor: Colors.green,
                                  decoration: InputDecoration(
                                      labelText: "Title",
                                      labelStyle: TextStyle(
                                          color: Colors.green, fontSize: 20),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.green)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                )),
                          ),
                          SizedBox(
                            height: 80,
                            // color: Colors.pink,
                            child: Expanded(
                                child: TextField(
                              controller: ti2,
                              // maxLines: 30,
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: "Description",
                                  labelStyle: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          llii.add(ti2.text);
                                        });
                                        setState(() {
                                          llii.add(ti2.text);
                                          ti2.clear();
                                          print(llii);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                        size: 30,
                                      ))),
                            )),
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: llii.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  llii[index].toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        llii.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.close)),
                              );
                            },
                          )),
                          // Container(
                          //   height: 100,
                          //   width: double.infinity,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       TextButton(
                          //           onPressed: () {
                          //             Navigator.pop(context);
                          //           },
                          //           child: Text(
                          //             "CANCEL",
                          //             style: TextStyle(
                          //                 fontWeight: FontWeight.bold),
                          //           )),
                          //       TextButton(
                          //           onPressed: () {
                          //             ls[i!]["title"] = ti.text;
                          //             ls[i!]["description"] = llii;
                          //             mybox.put(2, ls);
                          //             Navigator.pop(context);
                          //           },
                          //           child: Text("OK",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.bold)))
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          // =============================================================================================================================

          IconButton(
              onPressed: () {
                ls.removeAt(i!);
                mybox.put(2, ls);
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
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: li.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      li[index].toString(),
                    ),
                    leading: Checkbox(
                      activeColor: Colors.deepPurple,
                      value: ll[index],
                      onChanged: (bool? value) {
                        setState(() {
                          ll[index] = value ?? true;
                          ll[index] ? Colors.green : Colors.white;

                          ls[i!]['description'] = li;
                          mybox.put(2, ls);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
