import 'dart:convert';
import 'package:demo_flutter/models/book.dart';
import 'package:http/http.dart' as http;

class BookApi {
  static Future<List<Book>> getBooks() async {
    final url = Uri.https(
      'www.googleapis.com',
      '/books/v1/volumes',
      {'q': '{http}'},
    );

    final response = await http.get(url);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['items']) {
      _temp.add(i['volumeInfo']);
    }

    return Book.booksFromSnapshot(_temp);
  }
}