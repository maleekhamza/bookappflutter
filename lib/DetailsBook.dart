import 'dart:math';

import 'package:bookapp/ListScreen.dart';
import 'package:flutter/material.dart';
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


                Card(
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),

                  ),
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: Text(
                    book.Description,
                    style: const TextStyle(
                      height: 1.2,// the height between text, default is null
                      letterSpacing: 1.0, // the white space between letter, default is 0.0
                      fontSize: 20,
                      color: Colors.black,

                    ),

                  ),
                ),
                Text(
                  book.Price,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
                ElevatedButton(
                  onPressed: () async {

                      await DatabaseHandler()
                          .insertbook(Book(
                        Name: book.Name,
                        Price: book.Price,
                        UrlAvatar: book.UrlAvatar,
                        Description: book.Description,
                        id: Random().nextInt(50), ))
                          .whenComplete(() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListScreen()),
                      ));

                    },
                  child: const Text(
                    'Add to My Order',
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

