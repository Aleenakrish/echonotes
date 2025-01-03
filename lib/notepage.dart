import 'package:echonotes/addlist.dart';
import 'package:echonotes/addtask.dart';
import 'package:echonotes/addtext.dart';
import 'package:echonotes/listpage.dart';
import 'package:echonotes/textpage.dart';
import 'package:echonotes/taskpage.dart';
import 'package:flutter/material.dart';

class notepage extends StatefulWidget {
  const notepage({super.key});

  @override
  State<notepage> createState() => _notepageState();
}

class _notepageState extends State<notepage> with TickerProviderStateMixin {
  late TabController _taccontroller;
  bool t = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taccontroller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(8.0),
        color:const Color.fromARGB(255, 82, 182, 85),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Echo Notes",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TabBar(
                indicator: BoxDecoration(

                    // color: Colors.white,

                    // borderRadius: BorderRadius.circular(20),
                    ),
                controller: _taccontroller,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                // dividerColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Text",
                  ),
                  Tab(
                    text: "List",
                  ),
                  Tab(
                    text: "Task",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: _taccontroller,
                  children: [textpage(), listpage(), taskpage()]),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: t
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Addtask(),
                    ));
                  },
                  backgroundColor:const Color.fromARGB(255, 82, 182, 85),
                  child: Icon(
                      Icons.task_alt_outlined,color: Colors.black
                     
                      ),
                ),
                SizedBox(height: 7,),
                FloatingActionButton.small(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Addlist(),
                    ));
                  },
                  backgroundColor:const Color.fromARGB(255, 82, 182, 85),
                  child: Icon(
                    Icons.check_box, color: Colors.black,
                  ),
                ),
                SizedBox(height: 7,),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Addtext(),
                    ));
                  },
                  backgroundColor: const Color.fromARGB(255, 82, 182, 85),
                  child: Icon(
                    Icons.notes,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : FloatingActionButton(
              backgroundColor:const Color.fromARGB(255, 82, 182, 85),
              onPressed: () {
                setState(() {
                  t = true;
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 35,
              ),
            ),
    );
  }
}
