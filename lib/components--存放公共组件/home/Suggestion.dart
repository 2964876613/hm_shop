import 'package:flutter/material.dart';

class Suggestion extends StatefulWidget {
  Suggestion({Key? key}) : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsetsGeometry.symmetric(horizontal: 10),
    child: Container(
      alignment: Alignment.center,
       height: 250,
       color: Colors.blue,
       child: Text("推荐",style: TextStyle(color: Colors.white,fontSize: 40),),
    ) ) ;
  }
}