import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as english_words;

void main() => runApp(PolygonApp());

class PolygonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Startup name generator', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(english_words
                .generateWordPairs()
                .map((pair) => pair.asPascalCase)
                .take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String title) {
    return ListTile(title: Text(title, style: TextStyle(fontSize: 18.0)));
  }
}
