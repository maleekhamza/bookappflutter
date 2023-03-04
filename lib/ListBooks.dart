import 'package:bookapp/Book.dart';
import 'package:flutter/material.dart';

import 'DetailsBook.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<Book> books =[
   Book(
     id: 1,
       Name:'Practical Modern JavaScript',
       Price:'20dt',
      UrlAvatar:
'https://m.media-amazon.com/images/I/61fdqgSWGvL._AC_UF1000,1000_QL80_.jpg',
     Description:'To get the most out of modern JavaScript, you need learn the latest features of its parent specification, ECMAScript 6 (ES6). This book provides a highly practical look at ES6, without getting lost in the specification or its implementation details',
  ),
  Book(
    id: 2,
    Name:'Eloquent JavaScript, Third Edition',
    Price:' 60dt',
    UrlAvatar:'https://m.media-amazon.com/images/I/91asIC1fRwL._AC_UF1000,1000_QL80_.jpg',
    Description:'This is a book about JavaScript, programming, and the wonders of the digital',
  ),
  Book(
    id: 3,
    Name:'Understanding ECMAScript 6',
    Price:'20dt',
    UrlAvatar:
'https://m.media-amazon.com/images/I/817f4ZWXjhL._AC_UF1000,1000_QL80_.jpg',    Description:'ECMAScript 6 represents the biggest update to the core of JavaScript in the history of the language. In Understanding ECMAScript 6, expert developer Nicholas C. Zakas provides a complete guide to the object types, syntax, and other exciting changes that ECMAScript 6 brings to JavaScript',
  ),
  Book(
    id: 4,
    Name:'Speaking JavaScript',
    Price:'50dt',
    UrlAvatar:
'https://m.media-amazon.com/images/I/51AOPRqoYTL.jpg',
    Description:'Like it or not, JavaScript is everywhere these days -from browser to server to mobile- and now you, too, need to learn the language or dive deeper than you have. This concise book guides you into and through JavaScript, written by a veteran programmer who once found himself in the same position',
  ),
  Book(
    id: 5,
    Name:'Learning JavaScript Design Patterns',
    Price:'20dt',
    UrlAvatar:
    'https://m.media-amazon.com/images/I/91WlvEND3rL._AC_UF1000,1000_QL80_.jpg',
    Description:'With Learning JavaScript Design Patterns you ll learn how to write beautiful structured and maintainable JavaScript by applying classical and modern design patterns to the language. If you want to keep your code efficient more manageable and up-to-date with the latest best practices this book is for you',
  ),
  Book(
    id: 6,
    Name:'You Dont Know JS Yet' ,
    Price:'20dt',
    UrlAvatar:
    'https://m.media-amazon.com/images/I/410f-bUBR3L._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_PIStarRatingFOURANDHALF%2CBottomLeft%2C360%2C-6_SR600%2C315_ZA207%2C445%2C290%2C400%2C400%2CAmazonEmberBold%2C12%2C4%2C0%2C0%2C5_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg',
    Description:'The worldwide best selling You Don Know JS book series is back for a 2nd edition: You Dont Know JS Yet. All 6 books are brand new rewritten to cover all sides of JS for 2020 and beyond.',
  ),






];
  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('List Of Books'),
        centerTitle: true,

      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: ( context,  index){
    final book = books[index];
    return Card(

        child: SizedBox(
        width: 80,
        height: 80,
    child: ListTile(
      visualDensity: const VisualDensity(vertical: 2),
    leading: CircleAvatar(
      radius: 50,
    backgroundImage: NetworkImage(
        book.UrlAvatar,
    ),
    ),
    title: Text(book.Name),
    subtitle: Text(book.Price),
    trailing:const Icon(Icons.arrow_forward),
    onTap: (){
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context)=> DetailsBook(book:book)
    ));
    },
    )
        )
    );
    }),
    );
  }

}




