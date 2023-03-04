import 'dart:math';
import 'package:flutter/material.dart';
import 'Book.dart';
import 'ListScreen.dart';
import 'dbhelper.dart';


class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add book'),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[


            ],
          ),
        ),
      ),
    );
  }
}