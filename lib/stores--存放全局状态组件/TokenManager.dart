import 'dart:js_interop';

import 'package:hm_shop/constants--%E5%AD%98%E6%94%BE%E5%B8%B8%E9%87%8F%E6%96%87%E4%BB%B6/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  //初始化token
  //返回持久化对象的实例对象
  Future<SharedPreferences> _getInstance(){
    return SharedPreferences.getInstance();
  }
String _token="";
 Future<void> init() async {
    final prefs= await _getInstance();
    _token = prefs.getString(GlobalConstens.TOKEN_KEY)??" ";
  }
  //设置token
 Future<void> setToken(String val) async {
    //1.获取持久化实例
   final prefs= await _getInstance();
   prefs.setString(GlobalConstens.TOKEN_KEY, val);//token写入到持久化 磁盘
   _token = val;
  }
  //获取token
  String getToken() {
    return _token;
  }
  //删除token
  removeToken() async {
    final prefs= await _getInstance();
    prefs.remove(GlobalConstens.TOKEN_KEY); //磁盘
    _token=""; //内存
  }
}
final tokenManager = TokenManager();