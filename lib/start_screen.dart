import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.start, {super.key});

  final void Function() start;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/books.png',
            width: 300,
            color: const Color.fromARGB(131, 247, 246, 246),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Find Your Book !!!',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 30,
            ), 
          ),
          OutlinedButton.icon(
              onPressed: start,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white70,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start')
          )
        ],
      ),
    );
  }
}
