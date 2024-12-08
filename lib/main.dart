import 'package:flutter/material.dart';
import 'package:adv_basics/start.dart';
import 'package:provider/provider.dart';
import 'package:adv_basics/book_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
      ],
      child: const Start(),
    ),
  );
}
