import 'package:flutter/material.dart';

class Addlist extends StatefulWidget {
  const Addlist({super.key});

  @override
  State<Addlist> createState() => _AddlistState();
}

class _AddlistState extends State<Addlist> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  List ls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Add New List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 82, 182, 85),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: c1,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Title", style: TextStyle(fontSize: 18)),
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 82, 182, 85)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: c2,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Add to list",
                      style: TextStyle(fontSize: 18),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          // ls.add(index);
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return AlertDialog(
                          //       backgroundColor: Colors.transparent,
                          //       title: Text(
                          //         "Empty list",
                          //         style: TextStyle(fontSize: 15),
                          //       ),
                          //     );
                          //   },
                          // );
                        },
                        icon: Icon(
                          Icons.add,
                          size: 27,
                          color: Colors.green,
                        )),
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 82, 182, 85)))),
              ),
            )),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                ls.add(index);
              },
            ))
          ],
        ),
      ),
    );
  }
}
