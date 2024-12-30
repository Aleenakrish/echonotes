import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> with TickerProviderStateMixin {
  final key = GlobalKey<ExpandableFabState>();
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
      // appBar: AppBar(title: ,),
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
                        ),
                      ]),
                      
                ),
                Expanded(child: TabBarView(
                  controller: _tabController,
                  children: [
                  Container(),
                  Container(),
                  Container(),
                ]))
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
          duration: Duration(microseconds: 250),
          key: key,
          type: ExpandableFabType.up,
          pos: ExpandableFabPos.right,
          childrenOffset: Offset(5, 5),
          distance: 60,
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            backgroundColor: const Color.fromARGB(255, 82, 182, 85),
            foregroundColor: const Color.fromARGB(255, 82, 182, 85),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 35,
            ),
          ),
          closeButtonBuilder: FloatingActionButtonBuilder(
              size: 50,
              builder: (context, onPressed, progress) {
                return FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 82, 182, 85),
                    onPressed: () {
                      Navigator.pushNamed(context, "addnote");
                    },
                    child: Icon(
                      Icons.notes,
                      size: 35,
                      color: Colors.black,
                    ));
              }),
          children: [
            FloatingActionButton.small(
                heroTag: null,
                backgroundColor: const Color.fromARGB(255, 82, 182, 85),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "addlist");
                  },
                  child: Icon(
                    Icons.check_box,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {}),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "addnote");
              },
              child: FloatingActionButton.small(
                  heroTag: null,
                  backgroundColor: const Color.fromARGB(255, 82, 182, 85),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "addtask");
                      },
                      child: Icon(Icons.task_alt_outlined)),
                  onPressed: () {}),
            ),
          ]),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.pushNamed(context, "addnote");
      //     },
      //     backgroundColor: Color.fromARGB(255, 82, 182, 85),
      //     child: Icon(Icons.add)),
    );
  }
}
