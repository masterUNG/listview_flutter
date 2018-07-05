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

//  Create Content

  final myRandomWordArray = <WordPair>[];
  final myCheckedWords = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('This is appBar'),),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= myRandomWordArray.length) {
          myRandomWordArray.addAll(generateWordPairs().take(10));
        }
        return buildListTitle(myRandomWordArray[index], index);
      }),
    );
  }
  Widget buildListTitle(WordPair wordPair, int index) {
    final showColor = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = myCheckedWords.contains(wordPair);
    return new ListTile(
      leading: new Icon(isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: showColor,),
      title: new Text(wordPair.asUpperCase,
      style: new TextStyle(fontSize: 25.0, color: showColor),
      ),
      onTap: (){
        setState(() {
            if (isChecked) {
              myCheckedWords.remove(wordPair);
            } else {
              myCheckedWords.add(wordPair);
            }
        });
      },
    );
  } // Widget
}
