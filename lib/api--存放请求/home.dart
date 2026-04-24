//封装一个api 目的是返回业务侧要的数据结构
import 'package:hm_shop/constants--%E5%AD%98%E6%94%BE%E5%B8%B8%E9%87%8F%E6%96%87%E4%BB%B6/index.dart';
import 'package:hm_shop/utils--%E5%AD%98%E6%94%BE%E5%B7%A5%E5%85%B7%E7%B1%BB/diorequest.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/home.dart';

Future<List<BannerItem>> getBannerListAPI() async{
  return((await dioRequest.get(HttpConstens.BANNER_LIST)) as List).map((item)
  {
    return BannerItem.fromJSON(item as Map<String,dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async{
  return((await dioRequest.get(HttpConstens.CATEGORY_LIST)) as List).map((item)
  {
    return CategoryItem.fromJSON(item as Map<String,dynamic>);
  }).toList();
}
