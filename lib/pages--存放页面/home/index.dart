import 'package:flutter/material.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Category.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Hot.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/MoreList.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Slider.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Suggestion.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getHomeChildren (){
    return [
      SliverToBoxAdapter(child: HmSilder(),),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Category(),),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Suggestion(),),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child:Flex(
        children: [
          Expanded(child: Hot()),
          SizedBox(width: 10,),
          Expanded(child: Hot())
        ],
        direction: Axis.horizontal), )
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      MoreList()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers:_getHomeChildren() ,);
  }
}