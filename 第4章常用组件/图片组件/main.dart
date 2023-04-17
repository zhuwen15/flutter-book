import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Image demo',
    home: ImageDemo(),
  )
  );
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //居中展示
    return Center(
      //添加网络图片
      child: Image.network(
        //图片url
        'https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        //填充模式
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
