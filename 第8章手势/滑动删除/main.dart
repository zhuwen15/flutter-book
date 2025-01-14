import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(new MaterialApp(
    title: '滑动删除示例',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  //构建30条列表数据
  List<String> items = new List<String>.generate(30, (i) => "列表项 ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滑动删除示例'),
      ),
      //构建列表
      body: new ListView.builder(
        itemCount: items.length,//指定列表长度
        itemBuilder: (context, index) {//构建列表

          //提取出被删除的项
          final item = items[index];

          //返回一个可以被删除的列表项
          return new Dismissible(
              key: new Key(item),
              confirmDismiss: (direction) async {
                bool ret = false;
                await showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text('温馨提醒'),
                        content: Text('是否删除${item}?'),
                        actions: [
                          CupertinoDialogAction(
                            child: Text('取消'),
                            onPressed: () {
                              ret = false;
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('确定'),
                            onPressed: () {
                              ret = true;
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
                return ret;
              },
              //被删除回调
              onDismissed: (direction) {
                //移除指定索引项
                items.removeAt(index);
                // 底部弹出消息提示当前项被删除了
                ScaffoldMessenger.of(context).showSnackBar(
                    new SnackBar(content: new Text("$item 被删除了")));
              },
              child: new ListTile(title: new Text('$item'),)
          );
        },
      ),
    );
  }
}
