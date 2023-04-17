import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaisedButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RaisedButton组件示例'),
        ),
        body: Center(
          //ElevatedButton具有一种立体感
          child: ElevatedButton(
            //按下事件响应
            onPressed: () {
              //按下事件处理
            },
            //添加按钮文本
            child: const Text('ElevatedButton组件'),
          ),
        ),
      ),
    );
  }
}
