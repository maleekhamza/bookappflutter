import 'dart:math';

import 'package:bookapp/ListScreen.dart';
import 'package:flutter/material.dart';

import 'AddScreen.dart';
import 'Book.dart';
import 'dbhelper.dart';

class DetailsBook extends StatelessWidget {
  final Book book;
  final _formKey = GlobalKey<FormState>();
  String Name = "";
  String Price = "";
  String UrlAvatar = "";
  String Description = "";
   DetailsBook({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(book.Name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 250,
                  height: 250,
                  child: Image.network(book.UrlAvatar,fit: BoxFit.cover,),
                ),
                const SizedBox(height: 10),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Text(
                    book.Name,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),

                Text(
                  book.Price,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  book.Description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  //Textstyle
                ),
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

