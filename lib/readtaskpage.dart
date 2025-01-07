import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Readtaskpage extends StatefulWidget {
  const Readtaskpage({super.key});

  @override
  State<Readtaskpage> createState() => _ReadtaskpageState();
}

class _ReadtaskpageState extends State<Readtaskpage> {
  TextEditingController ti = TextEditingController();
  TextEditingController ti2 = TextEditingController();
  int? i;
  List ls = [];

  var mybox = Hive.box('mybox');
  void getdata() {
    if (mybox.get(1) != null) {
      setState(() {
        ls = mybox.get(1);
      });
    }
  }

  Timer? _timer;

  void tmer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        // if(Duration()==Duration(seconds: 5).inSeconds   ){

        // }
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
        backgroundColor: Colors.greenAccent.shade700,
        title: Center(
          child: Text(
            ls[i!]["title"].toString(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                ls.removeAt(i!);
                mybox.put(1, ls);
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
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: 15,),
            Expanded(
              flex: 8,
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    ls[i!]["description"].toString(),
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 1),
                  )),
            ),
            Flexible(
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 90,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(ls[i!]["date"].toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    ls[i!]["time"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
