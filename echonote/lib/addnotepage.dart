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
      appBar: AppBar(title: Text("Add New Note",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 82, 182, 85),actions: [
          Icon(Icons.task_alt_outlined,color: Colors.white,)
        ],),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Title"),
                  labelStyle: TextStyle(color: Colors.green),
                  enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: const Color.fromARGB(255, 82, 182, 85)))
                  ),
                  
              ),
            ),
            SizedBox(height: 10,),
            Expanded( 
          
              child: Container(
                 margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(  
                cursorColor: Colors.green,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Title"),
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: const Color.fromARGB(255, 82, 182, 85)))
                    ),
                            ),
              ))
          ],
        ),
      ),
    );
  }
}