import 'package:flutter/material.dart';

class ToastUtls {
  //阀门控制
  static bool showLoading=false;
  static void showToast(BuildContext context,String? msg){
    if(ToastUtls.showLoading)
    {
      return;
    }
    ToastUtls.showLoading=true;
    Future.delayed(Duration(seconds: 3), () {
      ToastUtls.showLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    width: 150,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(40)
    ),
    behavior: SnackBarBehavior.floating,
    content: Text(msg??"加载成功",textAlign: TextAlign.center,)));
  }
}