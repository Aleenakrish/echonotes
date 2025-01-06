import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class Textpage extends StatefulWidget {
  const Textpage({super.key});

  @override
  State<Textpage> createState() => _TextpageState();
}

class _TextpageState extends State<Textpage> {
  final List<Color> containerColors = [
    const Color.fromARGB(255, 203, 138, 214),
    const Color.fromARGB(255, 223, 159, 154),
    const Color.fromARGB(255, 119, 187, 122),
    const Color.fromARGB(255, 126, 164, 196),
    const Color.fromARGB(255, 199, 178, 202),
    Colors.yellow,
    const Color.fromARGB(255, 211, 146, 141),
    const Color.fromARGB(255, 252, 173, 55),
    const Color.fromARGB(255, 233, 225, 235),
    Colors.purple,
    const Color.fromARGB(255, 247, 241, 188),
    Colors.green,
    const Color.fromARGB(255, 253, 227, 187),
    const Color.fromARGB(255, 224, 162, 158),
  ];
  var mybox = Hive.box('mybox');
  List ls = [];
  @override
  void initfun() {
    if (mybox.get(3) != null) {
      setState(() {
        ls = mybox.get(3);
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initfun();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(15, (index) => 'Item ${index + 1}');
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 9, right: 6),
            height: double.infinity,
            width: double.infinity,
            child: MasonryGridView.builder(
              itemCount: ls.length,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "readtextpage",
                        arguments: index.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: containerColors[index],
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ls[index]['title'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
                        SizedBox(
                          height: 5,
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
            ))
        // Center(child: Text("task"),),
        );
  }
}
