import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> with TickerProviderStateMixin {
  late TabController _tabController;
  bool isfab = false;

  void isfabopen() {
    setState(() {
      isfab = !isfab;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 145,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 82, 182, 85),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    "Echo Note",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Container(
                  child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      indicatorColor: Colors.white,
                      controller: _tabController,
                      tabs: [
                        Container(
                          child: Tab(
                            text: "Text",
                          ),
                        ),
                        Tab(
                          text: "List",
                        ),
                        Tab(
                          text: "Task",
                        )
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 450,
          ),
          Container(
              margin: EdgeInsets.only(left: 260),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: MaterialButton(
                  onPressed: () {Navigator.pushNamed(context, "addtask");}, child: Icon(Icons.task_alt_rounded))),
                  SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(left: 260),
            height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: MaterialButton(
                  onPressed: () {Navigator.pushNamed(context, "addlist");}, child: Icon(Icons.check_box_outlined)))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "addnote");
          },
          backgroundColor: Color.fromARGB(255, 82, 182, 85),
          child: Icon(Icons.add)),
    );
  }
}
