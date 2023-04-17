import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    title: '图标组件示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图标组件示例'),
      ),
      //添加图标
      body: Icon(
        //图标内容
        Icons.phone,
        //图标颜色
        color: Colors.green[500],
        //图标大小
        size: 80.0,
      ),
    );
  }
}
