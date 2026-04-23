import 'package:flutter/material.dart';
import 'package:hm_shop/api--%E5%AD%98%E6%94%BE%E8%AF%B7%E6%B1%82/home.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Category.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Hot.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/MoreList.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Slider.dart';
import 'package:hm_shop/components--%E5%AD%98%E6%94%BE%E5%85%AC%E5%85%B1%E7%BB%84%E4%BB%B6/home/Suggestion.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList=[
    // BannerItem(
    //   id: "1",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"),
    // BannerItem(
    //   id: "2",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png"),
    //   BannerItem(
    //   id: "3",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg"),
  ];

  List<Widget> _getHomeChildren (){
    return [
      SliverToBoxAdapter(child: HmSilder(bannerList: _bannerList,),),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannderList();
  }
  void _getBannderList() async {
    _bannerList =await getBannerListAPI();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers:_getHomeChildren() ,);
  }
}