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

  final _formKey = GlobalKey<FormState>();
  String Name = "";
  String Price = "";
  String UrlAvatar = "";
  String Description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add book'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await DatabaseHandler()
                        .insertbook(Book(
                        Name: Name,
                        Price: Price,
                      UrlAvatar: UrlAvatar,
                        Description: Description,
                        id: Random().nextInt(50), ))
                        .whenComplete(() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListScreen()),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}