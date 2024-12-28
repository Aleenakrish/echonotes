import 'package:flutter/material.dart';

class Addtaskpage extends StatefulWidget {
  const Addtaskpage({super.key});

  @override
  State<Addtaskpage> createState() => _AddtaskpageState();
}

class _AddtaskpageState extends State<Addtaskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Add New Note",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 82, 182, 85),
        actions: [
          Icon(
            Icons.check,
            color: Colors.white,
          )
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
                maxLines: 26,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    label: Text("Description", style: TextStyle(fontSize: 18)),
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
