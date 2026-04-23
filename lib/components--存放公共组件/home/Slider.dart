import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/home.dart';

class HmSilder extends StatefulWidget {
  final List<BannnerItem> bannerList;
  HmSilder({Key? key,required this.bannerList}) : super(key: key);

  @override
  _HmSilderState createState() => _HmSilderState();
}

class _HmSilderState extends State<HmSilder> {
  

  Widget _getSlider()
  {
    final double screenWidth =MediaQuery.of(context).size.width;
    return CarouselSlider(items:List.generate(widget.bannerList.length, (index){
      return Image.network(widget.bannerList[index].imgUrl,
      fit:BoxFit.cover,
      width:screenWidth,);
    }), options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      height: 280,
      autoPlayInterval: Duration(seconds: 5)
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider()],
    );

    // return Padding(padding:EdgeInsetsGeometry.symmetric(horizontal: 0),
    // child: Container(
    //   alignment: Alignment.center,
    //    height: 250,
    //    color: Colors.blue,
    //    child: Text("轮播图",style: TextStyle(color: Colors.white,fontSize: 40),),
    // ) ) ;
    
  }
}