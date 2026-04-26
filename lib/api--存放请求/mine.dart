import 'package:hm_shop/constants--%E5%AD%98%E6%94%BE%E5%B8%B8%E9%87%8F%E6%96%87%E4%BB%B6/index.dart';
import 'package:hm_shop/utils--%E5%AD%98%E6%94%BE%E5%B7%A5%E5%85%B7%E7%B1%BB/diorequest.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/home.dart';

Future<GoodsDetailsItems> getGuessListAPI (Map<String,dynamic> params) async{
  return GoodsDetailsItems.fromJSON(await dioRequest.get(HttpConstens.GUESS_LIST,params: params));
}