import 'dart:math';

// import 'package:echonotes/readpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class taskpage extends StatefulWidget {
  const taskpage({super.key});

  @override
  State<taskpage> createState() => _taskpageState();
}

class _taskpageState extends State<taskpage> {
  final List<Color> containerColors=[
    Colors.red,
     const Color.fromARGB(255, 211, 146, 141), 
    Colors.blue, 
    const Color.fromARGB(255, 119, 187, 122), 
    Colors.orange, 
     const Color.fromARGB(255, 189, 156, 106), 
    Colors.purple,
     const Color.fromARGB(255, 151, 79, 163),
    Colors.yellow,
  ];
  var mybox = Hive.box('mybox');
  List ls = [];
  @override
  void gtdata() {
    if (mybox.get(1) != null) {
      setState(() {
        ls = mybox.get(1);
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
   
    // containerColors = List.generate(
    //   10, // Replace with your list length
    //   (index) => Colors.primaries[Random().nextInt(Colors.primaries.length)],
    // );
     gtdata();
  }

  @override
  Widget build(BuildContext context) {
     List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: MasonryGridView.builder(
            itemCount: ls.length,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              // Color containerColor = Color((index * 12345678) % 0xFFFFFF);
              return GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 5),
                  decoration: BoxDecoration(
                      // color: Colors.green[50],
                      color: containerColors[index],  
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius: BorderRadius.circular(15)
                      ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            ls[index]['title'].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 1),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                      Text(ls[index]['description'].toString(),
                          maxLines: 6,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              letterSpacing: 1))
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
