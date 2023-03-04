import 'package:flutter/material.dart';

class Book{
  final int id;
       final String Name;
       final String Price;
       final String UrlAvatar;
       final String Description;

    const Book({
      required this.id,
       required this.Name,
      required this.Price,
      required this.UrlAvatar,
      required this.Description,

}  );
       Map<String, dynamic> toMap() {
         return {
           'id': id,
           'Name': Name,
           'Price': Price,
           'UrlAvatar': UrlAvatar,
           'Description': Description,
         };
       }

  Book.fromMap(Map<String, dynamic> res)
           : id = res["id"],
            Name = res["Name"],
        Price = res["Price"],
           UrlAvatar = res["UrlAvatar"],
        Description = res["Description"];


  @override
  String toString() {
    return 'Book{id: $id, Name: $Name, Price: $Price, UrlAvatar: $UrlAvatar, Description: $Description}';
  }
}



