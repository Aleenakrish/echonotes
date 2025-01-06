// import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
    TextEditingController contoller1= TextEditingController();
  TextEditingController controller2=TextEditingController();
  var mybox=Hive.box('mybox');
    // List li=[];
      List ls=[];
        Map mp={};
  Timer? _timer;
  //  var tme;
// String? date;
void frequentupdate(){
  _timer=Timer.periodic(Duration(minutes: 1), (timer) {
    settime();
  },);
}
var minute;
var hour;
var day;
var month;
var year;

  void settime(){
   setState(() {

  
  hour = DateTime.now().hour; 
  minute = DateTime.now().minute; 
  day= DateTime.now().day; 
  month = DateTime.now().month; 
  year = DateTime.now().year; 
  //  date = dateToday.toString().substring(0,10);
  print(day);
  print(month);
  print(year);
  }
  );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settime();
    frequentupdate();
  }

  @override
  Widget build(BuildContext context) {
     String tm = "$hour:$minute".toString();
                String dt = "$day-$month-$year".toString();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:const Color.fromARGB(255, 82, 182, 85),
        title: Text(
          "Add New Task",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
         actions: [
          IconButton(
              onPressed: () {
                if (contoller1.text.isNotEmpty) {
                  if (mybox.get(1) == null) {
                    mp = {
                      "title": contoller1.text,
                      "description": controller2.text,
                      "time":tm,
                      "date":dt,

                    };
                    ls.add(mp);
                    mybox.put(1, ls);
                  } else {
                    ls = mybox.get(1);
                    mp = {
                      "title": contoller1.text,
                      "description": controller2.text, "time":tm,
                      "date":dt,

                    };
                    ls.add(mp);
                    mybox.put(1, ls);
                  }

                  contoller1.clear();
                  controller2.clear();
                  Navigator.pop(context);
                } else {
                  // showBottomSheet(context: context, builder: (context) {
                  // },);
                }
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
            SizedBox(height: 15,),
            SizedBox(
              height: 80,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    controller: contoller1,
                            cursorColor:const Color.fromARGB(255, 82, 182, 85),
                    decoration: InputDecoration(
                          labelText: "Title",
                labelStyle: TextStyle(color:const Color.fromARGB(255, 82, 182, 85),fontSize: 20),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.green)),

                        border: OutlineInputBorder(
                            borderSide: BorderSide(color:const Color.fromARGB(255, 82, 182, 85)))),
                  )),
            ),
            Expanded(
                child: TextField(
                  controller: controller2,
              maxLines: 30,
              cursorColor: const Color.fromARGB(255, 82, 182, 85),
              decoration: InputDecoration(alignLabelWithHint: true,
                labelText: "Description",
                labelStyle: TextStyle(color:const Color.fromARGB(255, 82, 182, 85),fontSize: 20,),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color:const Color.fromARGB(255, 82, 182, 85))),
                  border: OutlineInputBorder(
                    
                      borderSide: BorderSide(color: const Color.fromARGB(255, 82, 182, 85)))),
            )),
            Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$day-$month-$year".toString(),style: TextStyle(color: Colors.green)),
                  Text("$hour:$minute",style: TextStyle(color: Colors.green),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



 // actions: [IconButton(onPressed: () {

        //   if(mybox.get(3)==null){
        //     mp={"title":contoller1.text,"description":controller2.text};
        //   ls.add(mp);
        //   mybox.put(3, ls);
        //   }else{
        //     ls=mybox.get(3);
        //     mp={"title":contoller1.text,"description":controller2.text};
        //   ls.add(mp);
        //   mybox.put(3, ls);
        //   }
        //   contoller1.clear();
        //   controller2.clear();
        //   Navigator.pop(context);

        //         }, icon: Icon(Icons.check,color: Colors.white,))],
