import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class textpage extends StatefulWidget {
  const textpage({super.key});

  @override
  State<textpage> createState() => _textpageState();
}

class _textpageState extends State<textpage> {
  var mybox = Hive.box('mybox');
  List ls = [];
  @override
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
    gtdata();
  }

  @override
  Widget build(BuildContext context) {
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
                return Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ls[index]['title'].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                      Text(ls[index]['description'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ))
                    ],
                  ),
                );
              },
            ))
        );
  }
}










///////////////////////////////////////////////////////////////////////////////////////
// Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 1,
//                         ),
//                         Text(
//                           ls[index]['title'].toString(),
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18,
//                               letterSpacing: 1),
//                         ),
//                         IconButton(
//                           padding: EdgeInsets.all(0),
//                           onPressed: () {},
//                           icon: Icon(Icons.more_vert),
//                         )
//                       ],
//                     ),
//                     Text(ls[index]['description'].toString(),maxLines: 6,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 17,
//                             letterSpacing: 1))
//                   ],
//                 ),