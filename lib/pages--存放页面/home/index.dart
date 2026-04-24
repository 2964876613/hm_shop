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
  // 推荐列表
  List<GoodDetailItem> _recommendList = [];
  // 热榜推荐
  SpecialOfferResult? _inVogueResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialOfferResult? _oneStopResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  SpecialOfferResult? _productOfferResult=SpecialOfferResult(
    id: "",
    title: "", 
    subTypes: []);
  List<CategoryItem> _categoryList=[];
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
      SliverToBoxAdapter(child: Category(categoryList: _categoryList,),),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Suggestion(productOfferResult: _productOfferResult!,),),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
      child:Flex(
        children: [
          Expanded(
                child: Hot(result: _inVogueResult!, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Hot(result: _oneStopResult!, type: "step"),
              ),

        ],
        direction: Axis.horizontal), )
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      MoreList(recommendList: _recommendList),
    ];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannderList();
    _getCategoryList();
    _getProductList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }
  //监听滚动到底部的事件
  void _registerEvent(){
    _controller.addListener((){
     if(_controller.position.pixels> (_controller.position.maxScrollExtent-50))
     {
      _getRecommendList();
     };
    });
  }

  //获取banner列表
  void _getBannderList() async {
    _bannerList =await getBannerListAPI();
    setState(() {});
  }
  //获取分类列表
 // 获取分类列表（带防崩溃保护）
void _getCategoryList() async {
  try {
    // 1. 发起请求
    var data = await getCategoryListAPI();
    
    // 2. 打印看看拿到了什么
    print("✅ 分类请求成功，拿到的数据是: $data");
    
    // 3. 赋值并刷新 UI
    if (data != null) {
      _categoryList = data;
      setState(() {});
    }
  } catch (e) {
    // 4. 如果报错了，在这里拦截，不会导致程序卡死
    print("❌ 分类请求失败，错误原因: $e");
  }
}

//获取特惠推荐列表
 // 获取特惠推荐列表（带防崩溃保护）
void _getProductList() async {
  try {
    // 1. 发起请求
    var data = await getProductListAPI();
    
    // 2. 打印看看拿到了什么
    print("✅ 特惠推荐请求成功，拿到的数据是: $data");
    
    // 3. 赋值并刷新 UI
    if (data != null) {
      _productOfferResult = data;
      setState(() {});
    }
  } catch (e) {
    // 4. 如果报错了，在这里拦截，不会导致程序卡死
    print("❌ 特惠推荐请求失败，错误原因: $e");
  }
}

// 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }
  //页码
  int _page=1;
  bool _isLoading=false;//当前正在加载状态
  bool _hasMore=true;//是否还有下一页

// 获取推荐列表
  void _getRecommendList() async {
    //当已经有请求正在加载 或者已经没有下一页 就放弃请求
    if(_isLoading||!_hasMore){
      return;
    }
    _isLoading=true;//占住位置
    int requestLimit=_page*8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading=false;//松开位置
    setState(() {});
    if(_recommendList.length<requestLimit){
      _hasMore=false;
      return;
    }
    _page++;
  }

 final ScrollController _controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller ,//绑定控制器
      slivers:_getHomeChildren() ,);
  }
}