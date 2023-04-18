import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloatingActionButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButton示例'),
        ),
        body: Center(
          child: Text(
            'FloatingActionButton示例',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            //提示信息
            tooltip: "请点击FloatingActionButton",
            //前景色为白色
            foregroundColor: Colors.white,
            //背景色为蓝色
            backgroundColor: Colors.blue,
            //未点击阴影值
            elevation: 7.0,
            //点击阴影值
            highlightElevation: 14.0,
            onPressed: () {
              //点击回调事件 弹出一句提示语句
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                content: const Text("你点击了FloatingActionButton",
                    textAlign: TextAlign.center),
                actions: [
                  TextButton(
                    onPressed: () {
                      print('###:1');
                    },
                    child: Text('取消'),
                  ),
                  TextButton(
                    onPressed: () {
                      print('###:2');
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    },
                    child: Text('确定'),
                  )
                ],
              ));

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "你点击了FloatingActionButton",
                  textAlign: TextAlign.center,
                ),
                showCloseIcon: true,
                closeIconColor: Colors.white,
                duration: Duration(milliseconds: 20000),
              ));
            },
            mini: false,
            //圆形边
            shape: CircleBorder(),
            isExtended: false,
          );
        }),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat, //居中放置 位置可以设置成左中右
      ),
    );
  }
}
