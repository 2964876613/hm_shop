import 'package:flutter/material.dart';

class ToastUtls {
  static void showToast(BuildContext context,String? msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    width: 120,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(40)
    ),
    behavior: SnackBarBehavior.floating,
    content: Text(msg??"加载成功",textAlign: TextAlign.center,)));
  }
}