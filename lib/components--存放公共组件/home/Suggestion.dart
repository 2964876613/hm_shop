import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/home.dart';

class Suggestion extends StatefulWidget {
  final SpecialOfferResult productOfferResult;
  Suggestion({Key? key, required this.productOfferResult}) : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  //去前三条数据
  List<GoodsItem> _getDisplayItems(){
    if(widget.productOfferResult.subTypes.isEmpty) return [];
    return widget.productOfferResult.subTypes.first.goodsItems.items
    .take(3)
    .toList();
  }

  Widget _buildHeader(){
    return Row(
      children: [
        Text("特惠推荐",
        style: TextStyle(color: const Color.fromARGB(255, 101, 44, 39),
        fontSize: 18,
        fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 10,),
        Text("精选省攻略",
        style: TextStyle(color: const Color.fromARGB(255, 147, 67, 60),
        fontSize: 12,
        fontWeight: FontWeight.w400),)
      ],
    );
  }
  //左侧结构
  Widget _buildLeft(){
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: 
        AssetImage("lib/assets--存放资源/home_cmd_inner.png"),
        fit: BoxFit.cover,
        )
      ),
    );
  }
  List<Widget> _getChildrenList(){
    List<GoodsItem> list=_getDisplayItems();//取到前三条数据
    return List.generate(list.length, (index){
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:  Image.network(
              errorBuilder: (context,error,StackTrace){
                //返回一个新的部件替换原有图片
                return Image.asset("lib/assets--存放资源/home_cmd_inner.png",
                 width: 100,
                 height: 140,
                );
              },
              list[index].picture,
              width: 100,
              height: 140,
          fit:BoxFit.cover),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 236, 81, 14),
            borderRadius: BorderRadius.circular(12)),
            child: Text("￥${list[index].price}",style: TextStyle(color: Colors.white),),
          )
        ],
      );
    });
  }
  //完成渲染
  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsetsGeometry.symmetric(horizontal: 10),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image:AssetImage("lib/assets--存放资源/home_cmd_sm.png"),
        fit: BoxFit.cover)
      ),
      alignment: Alignment.center,
       height: 240,
       child:Column(
        children: [
          //顶部内容
           _buildHeader(),
           SizedBox(height: 10,),
           Row(
            children: [
              _buildLeft(),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _getChildrenList(),
              ))
            ],
           )

        ],
       ) ,
    ) ) ;
  }
}