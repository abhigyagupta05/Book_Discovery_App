import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adv_basics/books.dart';

class BookService{
  static const String baseURL = 'https://gutendex.com/books/';

  Future <Map<String, dynamic>> fetchBooks({String? url}) async{
        final response = await http.get(Uri.parse(url ?? baseURL));
        if (response.statusCode == 200){
            final data = json.decode(response.body);
            return {
                'next': data['next'], // Next page URL.
                'books': (data['results'] as List)
                    .map((book) => Book.fromJSON(book)) // Converts JSON to `Book` objects.
                    .toList(), 
            };
        }
        else {
            throw Exception("Failed to load books");
        }
    }
}