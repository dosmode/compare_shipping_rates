import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.purple[900]),
        home: RandomWords()
      );
  }
}


class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _randomWordPairs = <WordPair>[];
  Widget _buildList(){
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text('Find cloest shipping center near you'),
        ),
        ListTile(
          leading: Icon(Icons.add_chart),
          title: Text('Compare shipping rate'),
        ),
        ListTile(
          leading: Icon(Icons.gps_fixed),
          title: Text('Tracking your package'),
        ),
      ],
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Pacakge Rate'),
      ),
      body: _buildList()
    );
  }
}