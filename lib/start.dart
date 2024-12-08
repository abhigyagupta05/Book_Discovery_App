import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/books_list_screen.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState(){
    return _StartState();
  }
}

class _StartState extends State<Start> {
  Widget? activeScreen;

  @override
  void initState(){
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = const BookListScreen();
      });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 132, 66, 247),
                Color.fromARGB(255, 173, 135, 238),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}