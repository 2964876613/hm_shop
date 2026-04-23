import 'package:flutter/material.dart';

class Hot extends StatefulWidget {
  Hot({Key? key}) : super(key: key);

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.symmetric(horizontal:0),
    child: Container(
      alignment: Alignment.center,
       height: 200,
       width: 200,
       color: Colors.blue,
       child: Text("爆款推荐",style: TextStyle(color: Colors.white,fontSize: 20),),
    )) ;
  }
}