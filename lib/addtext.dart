import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Addtext extends StatefulWidget {
  const Addtext({super.key});

  @override
  State<Addtext> createState() => _AddtextState();
}

class _AddtextState extends State<Addtext> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  var mybox = Hive.box('mybox');
  Map mp = {};
  List ls = [];
  // Timer? _timer;e4
  //  var tme;
// String? date;
// void frequentupdate(){
//   _timer=Timer.periodic(Duration(minutes: 1), (timer) {
//     settime();
//   },);
// }
  // var minute;
  // var hour;
  // var day;
  // var month;
  // var year;

  // void settime() {
  //   setState(() {
  //     day = DateTime.now().day;
  //     hour = DateTime.now().hour;
  //     minute = DateTime.now().minute;
  //     month = DateTime.now().month;
  //     year = DateTime.now().year;
  //     //  date = dateToday.toString().substring(0,10);
  //     print(day);
  //     print(month);
  //     print(year);
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // settime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 82, 182, 85),
        title: Text(
          "Add New Note",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (mybox.get(3) == null) {
                  mp = {"title": c1.text, "description": c2.text};
                  ls.add(mp);
                  mybox.put(3, ls);
                } else {
                  ls = mybox.get(3);
                  mp = {"title": c1.text, "description": c2.text};
                  ls.add(mp);
                  mybox.put(3, ls);
                }
                c1.clear();
                c2.clear();
                Navigator.pop(context);
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
              height: 10,
            ),
            Container(
              height: 70,
              child: Expanded(
                  child: TextField(
                controller: c1,
                cursorColor: const Color.fromARGB(255, 82, 182, 85),
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 82, 182, 85),
                        fontSize: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.green)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              )),
            ),
            Expanded(
                child: TextField(
              controller: c2,
              maxLines: 30,
              cursorColor: const Color.fromARGB(255, 82, 182, 85),
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Content",
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
                          color: const Color.fromARGB(255, 82, 182, 85)))),
            )),
            // Container(
            //   height: 70,
            //   width: double.infinity,
            //   padding: EdgeInsets.only(left: 15, right: 15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("$day-$month-$year".toString(),
            //           style: TextStyle(
            //               color: const Color.fromARGB(255, 82, 182, 85),
            //               fontSize: 17)),
            //       Text(
            //         "$hour:$minute",
            //         style: TextStyle(
            //             color: const Color.fromARGB(255, 82, 182, 85),
            //             fontSize: 17),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}





// actions: [
        //   IconButton(
        //       onPressed: () {
        //         if (contoller1.text.isNotEmpty) {
        //           if (mybox.get(1) == null) {
        //             mp = {
        //               "title": contoller1.text,
        //               "description": controller2.text
        //             };
        //             ls.add(mp);
        //             mybox.put(1, ls);
        //           } else {
        //             ls = mybox.get(1);
        //             mp = {
        //               "title": contoller1.text,
        //               "description": controller2.text
        //             };
        //             ls.add(mp);
        //             mybox.put(1, ls);
        //           }

        //           contoller1.clear();
        //           controller2.clear();
        //           Navigator.pop(context);
        //         } else {
        //           // showBottomSheet(context: context, builder: (context) {
        //           // },);
        //         }
        //       },
        //       icon: Icon(
        //         Icons.check,
        //         color: Colors.white,
        //       ))
        // ],
