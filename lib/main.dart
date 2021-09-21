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
  String shipFromZipCode = "A place holder?";
  String shipToZipCode = "A place holder?";
  TextEditingController _shipFromZipCodeController = TextEditingController();
  TextEditingController _shipToZipCodeContoller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _shipFromZipCodeController.dispose();
  }

  void shipFromZipCodeChangesTrigger(zipCode){
    setState(() {
      this.shipFromZipCode = zipCode;
    });
  }
  void shipToZipCodeChangesTrigger(zipCode){
    setState(() {
      this.shipToZipCode = zipCode;
    });
  }
  final _randomWordPairs = <WordPair>[];
  Widget _buildList(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item){
        if(item.isOdd) return Divider();

        final index = item ~/ 2;
        if(index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPairs[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0),));
  }

  Widget build(BuildContext context){
    var _zipCodeError;
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Pacakge Rate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            TextField(
              controller: _shipFromZipCodeController,
              onChanged: (zipcode) => this.shipFromZipCodeChangesTrigger(zipcode),
              decoration: InputDecoration(
                hintText: "Please enter origin 5 digits zip code here ex) 78660",
                labelText: "Ship from zip Code",
                errorText: _zipCodeError,
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.grey
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                )
              ),
              keyboardType: TextInputType.number,
              // obscureText: true,
              maxLength: 5,
            ),
            TextField(
              controller: _shipToZipCodeContoller,
              onChanged: (output) => this.shipToZipCodeChangesTrigger(output),
              decoration: InputDecoration(
                  hintText: "Please enter destination 5 digits zip code here ex) 78660",
                  labelText: "Ship to zip Code",
                  hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  )
              ),
              keyboardType: TextInputType.number,
              // obscureText: true,
              maxLength: 5,
            ),
            ElevatedButton(onPressed: (){
              print("hello" + _shipFromZipCodeController.text);
              if(_shipFromZipCodeController.text.length<5){
                _zipCodeError = "Enter at least 5 digits";
              }else{
                _zipCodeError = "";
              }
            }, child: Text("Submit!"),),
            Text("User input/output test ! ship from zip code \n" + shipFromZipCode ),
            Text("user input/output test ! ship to zip code \n" + shipToZipCode )

          ],
        ),
      )
    );
  }
}