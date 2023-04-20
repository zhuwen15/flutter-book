import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  BuildContext? scaffoldContext;

  Future showDialog() async {
    showCupertinoDialog(
      context: scaffoldContext!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Alert'),
          content: Text('This is a test alert.'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                // Do something
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupertinoAlertDialog组件示例',
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            scaffoldContext = context;
            return TextButton(
                onPressed: showDialog,
                child: Text("show", style: TextStyle(color: Colors.white)));
          }),
          title: Text('CupertinoAlertDialog组件示例'),
        ),
        body: Center(
          //添加对话框
          child: CupertinoAlertDialog(
            title: Text('提示'), //对话框标题
            content: SingleChildScrollView(
              //对话框内容部分
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除?'),
                  Text('一旦删除数据不可恢复！'),
                ],
              ),
            ),
            //对话框动作按钮
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('确定'),
                onPressed: () {},
              ),
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
