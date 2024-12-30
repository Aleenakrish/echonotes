import 'dart:async';

import 'package:flutter/material.dart';

class Addtaskpage extends StatefulWidget {
  const Addtaskpage({super.key});

  @override
  State<Addtaskpage> createState() => _AddtaskpageState();
}

class _AddtaskpageState extends State<Addtaskpage> {
  /////////////////////////////////////////////////////////////time//////////////////////////////////
  Timer? _timer;
  DateTime dt = DateTime.now();
  String? ft;
  String? dateformat;
  int? a;
  String? M, Z = "";
  void starttime() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer time) {
      setState(() {
        dt = DateTime.now();
        ft =
            "${dt.hour.toString().padLeft(2, "0")}:${dt.minute.toString().padLeft(2, "0")}";
        int M = int.parse(dt.hour.toString());
        if (M >= 12) {
          Z = "PM";
          a = M - 12;
        } else {
          Z = "AM";
        }
        ;
      });
    });
  }

  //////////////////////////////////////////////////timeend//////////////////////////////////////////////

  var hour;
  var minute;
  var day;
  var month;
  var Year;

  void setdate() {
    setState(() {
      hour = DateTime.now().hour;
      minute = DateTime.now().minute;
      day = DateTime.now().day;
      month = DateTime.now().month;
      Year = DateTime.now().year;

      print(day);
      print(month);
      print(Year);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    starttime();
    setdate();
  }

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
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "notepage");
              },
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
                maxLines: 27,
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
            )),
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Container(
                  //   child: Text("${day.toString()}"),
                  // ),
                  // Container(
                  //   child: Text("${month.toString()}"),
                  // ),
                  // Container(
                  //   child: Text("${Year.toString()}"),
                  // ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "$day-$month-$Year".toString(),
                      style: TextStyle(color: Colors.green, fontSize: 22),
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "$hour:$minute".toString(),
                        style: TextStyle(color: Colors.green, fontSize: 22),
                      )),
                ],
              ),
            ),
            Container(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
