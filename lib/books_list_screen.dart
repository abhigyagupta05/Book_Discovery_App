import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adv_basics/book_provider.dart';
import 'package:adv_basics/book_detail_screen.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  BookListScreenState createState() => BookListScreenState();
}

class BookListScreenState extends State<BookListScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
            !Provider.of<BookProvider>(context, listen: false).isLoading) {
          Provider.of<BookProvider>(context, listen: false).fetchBooks(isNextPage: true);
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<BookProvider>(context, listen: false).fetchBooks();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BookProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.books.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: provider.books.length + (provider.isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == provider.books.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final book = provider.books[index];
              return ListTile(
                leading: book.coverImage != null
                    ? Image.network(book.coverImage!, width: 50, fit: BoxFit.cover)
                    : const SizedBox(width: 50),
                title: Text(book.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailScreen(book: book),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
