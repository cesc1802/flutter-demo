import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);

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

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
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
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [IconButton(icon: Icon(Icons.star), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }
}

class MyApp extends StatelessWidget {
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    );
  }

  Widget _titleSection() {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
  }

  Widget _buttonSection() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.green, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.green, Icons.share, 'SHARE'),
      ],
    ));
  }

  Widget _App() {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                // color: Colors.yellow,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.black54,
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.orange,
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.lightBlueAccent,
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Colors.pinkAccent,
                                        ))
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.blue,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              color: Colors.green,
                                            )),
                                            Expanded(
                                                child: Container(
                                              color: Colors.yellowAccent,
                                            ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 12,
          child: Container(
            color: Colors.pinkAccent,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter layout demo'),
          ),
          body: _App()),
    );
  }
}
