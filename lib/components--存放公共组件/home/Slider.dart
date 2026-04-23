import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/home.dart';

class HmSilder extends StatefulWidget {
  final List<BannerItem> bannerList;
  HmSilder({Key? key,required this.bannerList}) : super(key: key);

  @override
  _HmSilderState createState() => _HmSilderState();
}

class _HmSilderState extends State<HmSilder> {
  int _currentIndex=0;
  final CarouselSliderController _controller=CarouselSliderController();
Widget _getSlider()
  {
    final double screenWidth =MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller,
      items:List.generate(
      widget.bannerList.length, 
    (index){
      return Image.network(widget.bannerList[index].imgUrl,
      fit:BoxFit.cover,
      width:screenWidth,);
    }), options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      height: 280,
      autoPlayInterval: Duration(seconds: 5),
      onPageChanged: (index, reason) {
        _currentIndex=index;
        setState(() {});
      },
    ));
  }

    Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(padding: EdgeInsetsGeometry.all(10),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: 50, 
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "搜索...",
          style: TextStyle(color: Colors.white,fontSize: 16),
        ),
      ),),
          );
  }

  Widget _getDot(){
    return Positioned(
      right: 0,
      left: 0,
      bottom: 10,
      child:SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index){
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
                _currentIndex=index;
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
              margin: EdgeInsets.only(left: 10),
              height: 6,
              width:index==_currentIndex? 40:20,
              decoration: BoxDecoration(color:index==_currentIndex? Colors.white:Color.fromRGBO(0, 0, 0, 0.3),borderRadius: BorderRadius.circular(3)),
            )
            );
          }),
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider(),_getSearch(),_getDot()],
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