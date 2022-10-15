import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WidgetListView extends StatefulWidget {
  const WidgetListView({super.key});

  @override
  createState() => WidgetListViewState();
}

class WidgetListViewState extends State<WidgetListView> {
  final _suggestions = <WordPair>[];

  final _saved = <WordPair>{};

  final _biggerFont = const TextStyle(fontSize: 18.0);

  final tipStyle = const TextStyle(fontSize: 20.0, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget ListView'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.arrow_forward), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(18.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(
          () {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          },
        );
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Widget ListView'),
            ),
            body: Center(
                child: _saved.isNotEmpty
                    ? ListView(children: divided)
                    : Text('no data', style: tipStyle)),
          );
        },
      ),
    );
  }
}
