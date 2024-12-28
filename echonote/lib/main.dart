import 'package:echonote/Addtaskpage.dart';
import 'package:echonote/addlist.dart';
import 'package:echonote/addnotepage.dart';
import 'package:echonote/notepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Notepage(),
    routes: {
      "addtask": (context) => Addtaskpage(),
      "addnote": (context) => Addnotepage(),
      "addlist": (context) => Addlist()
    },
  ));
}
