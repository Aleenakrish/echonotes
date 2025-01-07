// import 'package:echonotes/listpage.dart';
import 'package:echonotes/notepage.dart';
import 'package:echonotes/readlistpage.dart';
import 'package:echonotes/readpage.dart';
import 'package:echonotes/readtaskpage.dart';
import 'package:echonotes/readtextpage.dart';
import 'package:echonotes/taskpage.dart';
// import 'package:echonotes/textpage.dart';
// import 'package:echonotes/taskpage.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MaterialApp(
    // home: notepage(),
    // home: MyApp(),
    initialRoute: 'ntpg',
    routes: {
      "readpage": (context) => ReadPage(),
      "readtextpage": (context) => Readtextpage(),
      "ntpg": (context) => notepage(),
      "readlistpage": (context) => Readlistpage(),
      "taskpage": (context) => Taskpage(),
      "readtaskpage": (context) => Readtaskpage()
      // "textpage": (context) => textpage(),
      // "listpage": (context) => listpage()
    },
  ));
}
