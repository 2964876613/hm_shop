import 'package:flutter/material.dart';

class MoreList extends StatefulWidget {
  MoreList({Key? key}) : super(key: key);

  @override
  _MoreListState createState() => _MoreListState();
}

class _MoreListState extends State<MoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // 给整个网格的左右加上 10 像素的边距（与上面的组件对齐）
      padding: const EdgeInsets.symmetric(horizontal: 10), 
      
      // 2. sliver 属性里面放你的网格
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          // 3. 这里变得非常干净，直接返回 Container 即可
          // 把之前那个包裹在外面、padding 为 0 的废代码删掉
          return Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: const Text(
              "商品",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          );
        },
      ),
    );
  }
}