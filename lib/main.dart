import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(new MyStateLessWidget());
}


class MyStateLessWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(title: 'ListView Title',
      home: new MyStateFulWidget(),);
  }

}

class MyStateFulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyState();
  }

}

// ignore: type_argument_not_matching_bounds
class MyState extends State<MyStateFulWidget>{

  final myRandomWord = new WordPair.random();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('This is appBar'),),
      body: new Center(child: new Text(myRandomWord.asUpperCase),),
    );
  }
}
