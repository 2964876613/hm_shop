import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),
            height: 100,
            width: 100,
            color: Colors.blue,
            child: Text(
              "分类${index+1}",
              style:TextStyle(color: Colors.white,fontSize: 15),
            ),
          );
      }),
    );
  }
}