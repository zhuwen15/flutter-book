import 'package:flutter/material.dart';

void main() =>
    runApp(
      MaterialApp(
        title: 'Drawer抽屉组件示例',
        home: LayoutDemo(),
      ),
    );

class LayoutDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  late bool _needScroll = true;
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
          child: Listener(
              child: ListView(
                controller: _controller,
                padding: EdgeInsets.zero,
                physics: _needScroll
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  //设置用户信息 头像、用户名、Email等
                  UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: const Text(
                      "玄微子",
                    ),
                    accountEmail: const Text(
                      "xuanweizi@163.com",
                    ),
                    //设置当前用户头像
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("images/1.jpeg"),
                    ),
                    onDetailsPressed: () {
                      print('onDetailsPressed');
                    },
                    //属性本来是用来设置当前用户的其他账号的头像 这里用来当QQ二维码图片展示
                    otherAccountsPictures: <Widget>[
                      Container(
                        child: Image.asset('images/code.jpeg'),
                      ),
                    ],
                    arrowColor: Colors.white,
                  ),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.color_lens)), //导航栏菜单
                    title: Text('个性装扮'),
                  ),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.photo)),
                    title: Text('我的相册'),
                  ),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.wifi)),
                    title: Text('免流量特权'),
                  ),
                ],
              ),
              onPointerMove: (details) {
                print('####onPointerMove: ${details.localDelta}');
                print('####_controller.offset: ${_controller.offset}');
                var localNeedScroll = true;
                if (_controller.offset <= 0 && details.localDelta.dy > 0) {
                  localNeedScroll = false;
                } else {
                  localNeedScroll = true;
                }
                if (_needScroll != localNeedScroll) {
                  setState(() {
                    _needScroll = localNeedScroll;
                  });
                }

              }
          )),
    );
  }
}
