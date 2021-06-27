import 'package:flutter/material.dart';
import 'package:startup_name_generator/features/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.black
      ),
      home: RandomWords(),
    );
  }
}
