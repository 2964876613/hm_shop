//管理路由
import 'package:flutter/material.dart';
import 'package:hm_shop/pages--%E5%AD%98%E6%94%BE%E9%A1%B5%E9%9D%A2/login/index.dart';
import 'package:hm_shop/pages--%E5%AD%98%E6%94%BE%E9%A1%B5%E9%9D%A2/main/indext.dart';
//返回App根级组件
Widget getRootWidget()
{
  return  MaterialApp(
    initialRoute: '/',
    routes: getRootRoutes(),
  );
}
//返回该App的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes()
{
  return {
    '/':(context)=>MainPage(),            //主页
    '/login':(context)=> LoginPage()       //登录页
  };
}