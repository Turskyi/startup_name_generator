import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritesWords extends StatefulWidget {
  final List divided;

  const FavouritesWords({ @required this.divided});

  @override
  _FavouritesWordsState createState() => _FavouritesWordsState();
}

class _FavouritesWordsState extends State<FavouritesWords> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: widget.divided),
      backgroundColor: Colors.black54,
    );
  }
}