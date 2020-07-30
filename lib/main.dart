import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(color: Colors.white, fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return ListTile(
      tileColor: Colors.black,
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder:
            /*1
        The itemBuilder callback is called once per suggested word pairing, and
        places each suggestion into a ListTile row.*/
            (context, i) {
          if (i.isOdd)
            return Divider(
              color: Colors.white,
            );
          /*2
          dd a one-pixel-high divider widget before each row in the ListView.*/

          final index = i ~/ 2;
          /*3
          Add a one-pixel-high divider widget before each row in the ListView.*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
            /*4
            If you’ve reached the end of the available word pairings,
            then generate 10 more and add them to the suggestions list.*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
      backgroundColor: Colors.black54,
    );
  }
}
