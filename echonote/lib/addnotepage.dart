import 'package:flutter/material.dart';

class Addnotepage extends StatefulWidget {
  const Addnotepage({super.key});

  @override
  State<Addnotepage> createState() => _AddnotepageState();
}

class _AddnotepageState extends State<Addnotepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:IconThemeData(color: Colors.white),
        title: Text(
          "Add New Note",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 82, 182, 85),
        actions: [
          IconButton(
              onPressed: () {Navigator.pushNamed(context, "notepage");},
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
                maxLines: 28,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    label: Text("Content", style: TextStyle(fontSize: 18)),
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 82, 182, 85)))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
