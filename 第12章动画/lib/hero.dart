import 'package:flutter/material.dart';

//页面切换动画
class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面切换动画图一"),
      ),
      //点击切换
      body: GestureDetector(
        //添加动画组件
        child: Hero(
          tag: '第一张图片',
          child: Image.network(
            "https://gimg3.baidu.com/search/src=http%3A%2F%2Fpics3.baidu.com%2Ffeed%2Fa686c9177f3e6709e6239752a4699731f9dc55b2.jpeg%40f_auto%3Ftoken%3D786626c00e5812b05c6bbbd6c3117207&refer=http%3A%2F%2Fwww.baidu.com&app=2021&size=f360,240&n=0&g=0n&q=75&fmt=auto?sec=1682442000&t=a5d5a0f18e807d2322355bb252b341c3",
          ),
        ),
        onTap: (){
          //路由至第第二个页面
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return DestinationPage();
          }));
        },
      ),
    );
  }
}
//第二个页面即目标页面
class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面切换动画图二"),
      ),
      //点击返回
      body: GestureDetector(
        //添加动画组件
        child: Hero(
          tag: "第二张图片",
          child: Image.network("https://gimg3.baidu.com/search/src=http%3A%2F%2Fpics7.baidu.com%2Ffeed%2Faec379310a55b319959561c5dc078a2acefc1748.jpeg%40f_auto%3Ftoken%3Dcc5ca7f59ea9b679ac018e4129ab6544&refer=http%3A%2F%2Fwww.baidu.com&app=2021&size=f360,240&n=0&g=0n&q=75&fmt=auto?sec=1682442000&t=9ecc8898b3d7d4f853a4b2a448829381"),
        ),
        onTap: (){
          //页面返回
          Navigator.pop(context);
        },
      ),
    );
  }
}