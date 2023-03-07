import 'package:flutter/material.dart';
import 'Book.dart';
import 'dbhelper.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late DatabaseHandler handler;
   late Future<List<Book>> _book;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _book = getList();
      });
    });
  }

  Future<List<Book>> getList() async {
    return await handler.books();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _book = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite books'),
      ),

      body: FutureBuilder<List<Book>>(
        future: _book,
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return new Text('Error: ${snapshot.error}');
          } else {
            final items = snapshot.data ?? <Book>[];
            return new Scrollbar(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Icon(Icons.delete_forever),
                      ),
                      key: ValueKey<int>(items[index].id),
                      onDismissed: (DismissDirection direction) async {
                        await handler.deletebook(items[index].id);
                        setState(() {
                          items.remove(items[index]);
                        });
                      },
                      child: Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                              title: new Text(items[index].Name),
                            subtitle: new Text(items[index].Price),
                              leading: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              items[index].UrlAvatar,
                            ),
                          ),
                          )),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}