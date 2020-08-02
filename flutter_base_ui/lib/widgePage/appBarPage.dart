import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> with SingleTickerProviderStateMixin{
  List<String> _abs = ['A', 'B', 'S'];
  TabController _tabController; // TabBar 必须传入这个参数

  var _isChecked = false;
  var _isTitleChecked = false;
  var _isOn = false;
  var _isTitleOn = false;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: _abs.length, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    // 需要在界面 dispose 之前把 _tabController dispose，防止内存泄漏
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 标题内容居中
        automaticallyImplyLeading: false, // 不使用默认
        leading: Icon(Icons.menu, color: Colors.red, size: 30.0), // 左侧按钮
        flexibleSpace: Image.asset('images/meizi.jpeg', fit: BoxFit.cover), // 背景
        title: Text('AppBar Demo', style: TextStyle(color: Colors.red)), // 标题内容
        // 末尾的操作按钮列表
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (val) => print('Selected item is $val'),
              icon: Icon(Icons.more_vert, color: Colors.red),
              itemBuilder: (context) =>
                  List.generate(_abs.length, (index) => PopupMenuItem(value: _abs[index], child: Text(_abs[index]))))
        ],
        // bottom: TabBar(
        //     labelColor: Colors.red, // 选中时的颜色
        //     unselectedLabelColor: Colors.white, // 未选中颜色
        //     controller: _tabController,
        //     isScrollable: false, // 是否固定，当超过一定数量的 tab 时，如果一行排不下，可设置 true
        //     indicatorColor: Colors.yellow, // 导航的颜色
        //     indicatorSize: TabBarIndicatorSize.tab, // 导航样式，还有个选项是 TabBarIndicatorSize.label tab 时候，导航和 tab 同宽，label 时候，导航和 icon 同宽
        //     indicatorWeight: 5.0, // 导航高度
        //     tabs: List.generate(_abs.length, (index) => Tab(text: _abs[index], icon: Icon(Icons.android)))), // 导航内容列表
      ),
      
      drawer: Drawer(
        child:SafeArea(child: Container(
          child: Text('Drawer', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30.0)),
        ),)
      ),
     );
  }
}