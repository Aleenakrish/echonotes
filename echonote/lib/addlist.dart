import 'package:flutter/material.dart';

class Addlist extends StatefulWidget {
  const Addlist({super.key});

  @override
  State<Addlist> createState() => _AddlistState();
}

class _AddlistState extends State<Addlist> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  List ls = [];

  void adddata() {
    setState(() {
      ls.add(c1.text);
      c1.clear();
    });
  }

  void removeData(String index) {
    setState(() {
      ls.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Add New List",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.only(left: 5,right: 5),
              child: TextField(
                controller: c2,
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(fontSize: 17,
                      color: const Color.fromARGB(255, 36, 167, 40),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 36, 167, 40),
                            width: 2))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
               padding: EdgeInsets.only(left: 5,right: 5),
              child: TextField(
                controller: c1,
                decoration: InputDecoration(
                  labelText: "Add to list",
                  
                  suffixIcon: IconButton(
                    onPressed: () {
                      adddata();
                    },
                    icon: Icon(
                      Icons.add,
                      color: const Color.fromARGB(255, 36, 167, 40),
                      size: 30,
                    ),
                  ),
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(fontSize: 17,
                    color: const Color.fromARGB(255, 36, 167, 40),
                  ),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 36, 167, 40), width: 2),
                  ),
                ),
              ),
            ),
            
            Container(
              child: Expanded(
                  child: ListView.builder(
                itemCount: ls.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(ls[index]),
                  );
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}
