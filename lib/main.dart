// import 'package:echonotes/listpage.dart';
import 'package:echonotes/notepage.dart';
import 'package:echonotes/readpage.dart';
import 'package:echonotes/readtextpage.dart';
// import 'package:echonotes/textpage.dart';
// import 'package:echonotes/taskpage.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MaterialApp(
    home: notepage(),
    // home: ListTask(),
    routes: {"readpage": (context) => ReadPage(),
    "readtextpage":(context)=>Readtextpage()
    // "taskpage": (context) => taskpage(),
    // "textpage": (context) => textpage(),
    // "listpage": (context) => listpage()
    },
  ));
}
