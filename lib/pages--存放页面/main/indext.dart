import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/pages--%E5%AD%98%E6%94%BE%E9%A1%B5%E9%9D%A2/cart/index.dart';
import 'package:hm_shop/pages--%E5%AD%98%E6%94%BE%E9%A1%B5%E9%9D%A2/category/index.dart';
import 'package:hm_shop/pages--%E5%AD%98%E6%94%BE%E9%A1%B5%E9%9D%A2/home/index.dart';
import 'package:hm_shop/pages--%E5%AD%98%E6%94%BE%E9%A1%B5%E9%9D%A2/my/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  final List<Map<String,String>> _tablist=[
    {
      "icon":"lib/assets--存放资源/ic_public_home_normal.png",
      "active_icon":"lib/assets--存放资源/ic_public_home_active.png",
      "text":"首页"
    },
    {
      "icon":"lib/assets--存放资源/ic_public_pro_normal.png",
      "active_icon":"lib/assets--存放资源/ic_public_pro_active.png",
      "text":"分类"
    },
    {
      "icon":"lib/assets--存放资源/ic_public_cart_normal.png",
      "active_icon":"lib/assets--存放资源/ic_public_cart_active.png",
      "text":"购物车"
    },
    {
      "icon":"lib/assets--存放资源/ic_public_my_normal.png",
      "active_icon":"lib/assets--存放资源/ic_public_my_active.png",
      "text":"我的"
    },
  ];
  int _currentIndex=0;
  List<BottomNavigationBarItem> _getTapBarWidget(){
    return List.generate(_tablist.length, (int index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tablist[index]["icon"]!,
        width: 30,
        height: 30,),
        activeIcon:Image.asset(_tablist[index]["active_icon"]!,
        width: 30,
        height: 30,),
        label: _tablist[index]["text"]
      );
    });
  }
  List<Widget> _getChildren(){
    return [HomeView(),CategoryView(),CartView(),MineView()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:IndexedStack(
        index: _currentIndex,
        children: _getChildren(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (int index){
          _currentIndex=index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items:_getTapBarWidget(), ),
    );
  }
}