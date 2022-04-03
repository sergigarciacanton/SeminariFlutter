import 'package:flutter/material.dart';
import 'package:demo_flutter/Routes/book.api.dart';
import 'package:demo_flutter/models/book.dart';
import 'package:demo_flutter/views/widgets/book_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> _books;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  Future<void> getBooks() async {
    _books = await BookApi.getBooks();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.book),
              SizedBox(width: 10),
              Text('Books List')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _books.length,
                itemBuilder: (context, index) {
                  return BookCard(
                      title: _books[index].title,
                      pageCount: _books[index].pageCount.toString(),
                      rating: _books[index].averageRating.toString(),
                      thumbnailUrl: _books[index].imageLink);
                },
              ));
  }
}