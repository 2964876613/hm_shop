import 'package:flutter/material.dart';

class HmSilder extends StatefulWidget {
  HmSilder({Key? key}) : super(key: key);

  @override
  _HmSilderState createState() => _HmSilderState();
}

class _HmSilderState extends State<HmSilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsetsGeometry.symmetric(horizontal: 0),
    child: Container(
      alignment: Alignment.center,
       height: 250,
       color: Colors.blue,
       child: Text("轮播图",style: TextStyle(color: Colors.white,fontSize: 40),),
    ) ) ;
    
  }
}