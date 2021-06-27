import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_name_generator/features/favourites_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _wordPairs = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(color: Colors.white, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
      backgroundColor: Colors.black54,
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder:
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
      if (index >= _wordPairs.length) {
        _wordPairs.addAll(generateWordPairs().take(10));
        /*4
            If you’ve reached the end of the available word pairings,
            then generate 10 more and add them to the suggestions list.*/
      }
      return _buildRow(_wordPairs[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      /* removes weird white shadow of title */
      tileColor: Colors.black,
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.white,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            color: Colors.white,
            context: context,
            tiles: tiles,
          ).toList();
          return FavouritesWords(divided: divided);
        },
      ),
    );
  }
}
