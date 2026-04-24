import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/home.dart';

class Category extends StatefulWidget {
  final List<CategoryItem> categoryList;
  Category({Key? key,required this.categoryList}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: widget.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          CategoryItem item = widget.categoryList[index]; 
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(134, 108, 108, 0.118),
              borderRadius: BorderRadius.circular(40),
            ),  
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(item.picture,width: 50,height: 50,),
                Text(item.name,style: TextStyle(color: Colors.black,fontSize: 15),),
              ],
            ),
          );
      }),
    );
  }
}