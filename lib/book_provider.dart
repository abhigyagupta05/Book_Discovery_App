import 'package:flutter/material.dart';
import 'package:adv_basics/book_service.dart';
import 'package:adv_basics/books.dart';

class BookProvider with ChangeNotifier {
  final BookService _bookService = BookService();

  final List<Book> _books = [];
  bool _isLoading = false;

  String? _nextURL;

  List<Book> get books => _books;
  bool get isLoading => _isLoading;

  Future<void> fetchBooks({bool isNextPage = false}) async {
    if (isNextPage && _nextURL == null) return;

    _isLoading = true; //data fetching process has started
    notifyListeners(); // notifies all UI Widgets about the state change, triggering a UI update

    try{
      final response = await _bookService.fetchBooks(url: isNextPage ? _nextURL  : null);
    _nextURL = response['next'];
    _books.addAll(_books);
    }

    catch (e){
      // Handle errors
    }

    finally {
    _isLoading = false;
    notifyListeners();
    }
  }
}