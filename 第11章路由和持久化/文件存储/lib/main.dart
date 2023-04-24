import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: '文件存储示例',
      home: LogInfo(),
    );
  }
}

class LogInfo extends StatefulWidget {
  const LogInfo({super.key});

  @override
  LogInfoState createState() => LogInfoState();
}

class LogInfoState extends State<LogInfo> {
  //日志id
  int logId = 0;

  //日志内容
  String logInfo = '';

  //文件对象
  File? file;

  @override
  void initState() {
    super.initState();
    //读取日志信息
    readLogInfo().then((String value) {
      setState(() {
        logInfo = value;
      });
    });
  }

  //获取文件对象
  Future<File> getFile() async {
    //获取文件所在目录路径
    String dir = (await getApplicationDocumentsDirectory()).path;
    //创建文件
    file ??= File('$dir/log.txt');
    return file!;
  }

  //读取日志信息
  Future<String> readLogInfo() async {
    try {
      File file = await getFile();
      //读取文件中存储的内容并返回
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return '';
    }
  }

  //写入日志信息
  Future<void> writeLogInfo() async {
    //日志id号自增
    setState(() {
      logId++;
    });
    //getFile:获取File对象
    //writeAsString:写入数据
    //FileMode:文件写入模式为追加模式这样就可以把每次写入的信息记录起来
    //两个await是因为有两个异步操作
    // await (await getFile())
    //     .writeAsString('日志信息:$logId\n', mode: FileMode.write);
    await (await getFile())
        .writeAsString('日志信息:$logId\n', mode: FileMode.append);
    readLogInfo().then((String value) {
      setState(() {
        logInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('文件存储示例')),
      body: Center(
        child: Text(logInfo),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: writeLogInfo,
        tooltip: '写入日志',
        child: const Icon(Icons.add),
      ),
    );
  }
}
