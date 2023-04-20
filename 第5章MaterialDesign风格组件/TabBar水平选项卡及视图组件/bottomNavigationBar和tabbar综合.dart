import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;

  //导航栏按钮选中对应数据
  final _widgetOptions = [
    MyHomePage(),
    const Text('Index 1: 通讯录'),
    const Text('Index 2: 发现'),
  ];

  final _titleOptions = [
    const Text('信息'),
    const Text('通讯录'),
    const Text('发现'),
  ];

  //选择按下处理 设置当前索引为index值
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: _titleOptions.elementAt(_selectedIndex),
          elevation: 0.0,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex), //居中显示某一个文本
        ),
        //底部导航按钮集
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            //底部导航按钮项 包含图标及文本
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: '信息'),
            BottomNavigationBarItem(icon: Icon(Icons.contacts), label: '通讯录'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: '发现'),
          ],
          currentIndex: _selectedIndex, //当前选中项的索引
          fixedColor: Colors.deepPurple, //选项中项的颜色
          onTap: _onItemTapped, //选择按下处理
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(color: Colors.blue, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ]),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: items.map((ItemView item) {
                //迭代添加选项卡按钮子项
                //选项卡按钮由文本及图标组成
                return Tab(
                  text: item.title,
                  icon: Icon(item.icon),
                );
              }).toList(),
            )),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: items.map((ItemView item) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectedView(item: item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

//视图项数据
class ItemView {
  const ItemView({required this.title, required this.icon}); //构造方法 传入标题及图标
  final String title; //标题
  final IconData icon; //图标
}

//选项卡的类目
const List<ItemView> items = const <ItemView>[
  const ItemView(title: '自驾', icon: Icons.directions_car),
  const ItemView(title: '自行车', icon: Icons.directions_bike),
  const ItemView(title: '轮船', icon: Icons.directions_boat),
  const ItemView(title: '公交车', icon: Icons.directions_bus),
  const ItemView(title: '火车', icon: Icons.directions_railway),
  const ItemView(title: '步行', icon: Icons.directions_walk),
];

//被选中的视图
class SelectedView extends StatelessWidget {
  const SelectedView({super.key, required this.item});

  //视图数据
  final ItemView item;

  @override
  Widget build(BuildContext context) {
    //获取文本主题样式
    final TextStyle? textStyle = Theme.of(context).textTheme.displaySmall;
    //添加卡片组件 展示有质感
    return Card(
      //卡片颜色
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, //垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center, //水平方向居中对齐
          children: <Widget>[
            Icon(item.icon, size: 128.0, color: textStyle?.color ?? Colors.red),
            Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
