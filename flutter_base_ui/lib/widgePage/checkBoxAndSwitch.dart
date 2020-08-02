import 'package:flutter/material.dart';

class CheckBoxAndSwitchPage extends StatefulWidget {
  @override
  _CheckBoxAndSwitchPageState createState() => _CheckBoxAndSwitchPageState();
}

class _CheckBoxAndSwitchPageState extends State<CheckBoxAndSwitchPage> with SingleTickerProviderStateMixin{
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
      body: Container(
        child:Column(
          children: <Widget>[
            Row(
              children:[
                Checkbox(
                  // 是否开启三态
                  tristate: true,
                  // 控制当前 checkbox 的开启状态
                  value: _isChecked,
                  // 不设置该方法，处于不可用状态
                  onChanged: (checked) {
                    // 管理状态值
                    setState(() => _isChecked = checked);
                  },
                  // 选中时的颜色
                  activeColor: Colors.pink,
                  // 这个值有 padded 和 shrinkWrap 两个值，
                  // padded 时候所占有的空间比 shrinkWrap 大，别的原谅我没看出啥
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                 /// 点击无响应
                 Checkbox(value: _isChecked, onChanged: null, tristate: true)
              ]
            ),
            Row(
              children:[
                 Switch(
                // 开启时候，那个条的颜色
                activeTrackColor: Colors.yellow,
                // 关闭时候，那个条的颜色
                inactiveTrackColor: Colors.yellow[200],
                // 设置指示器的图片，当然也有 color 可以设置
                activeThumbImage: AssetImage('images/ali.jpg'),
                inactiveThumbImage: AssetImage('images/ali.jpg'),
                // 开始时候的颜色，貌似会被 activeTrackColor 顶掉
                activeColor: Colors.pink,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: _isOn,
                onChanged: (onState) {
                  setState(() => _isOn = onState);
                }),

            /// 点击无响应
            Switch(value: _isOn, onChanged: null)
              ]
            ),
              CheckboxListTile(
          // 描述选项
          title: Text('Make this item checked'),
          // 二级描述
          subtitle: Text('description...description...\ndescription...description...'),
          // 和 checkbox 对立边的部件，例如 checkbox 在头部，则 secondary 在尾部
          secondary: Image.asset('images/ali.jpg', width: 30.0, height: 30.0),
          value: _isTitleChecked,
          // title 和 subtitle 是否为垂直密集列表中一员，最明显就是部件会变小
          dense: true,
          // 是否需要使用 3 行的高度，该值为 true 时候，subtitle 不可为空
          isThreeLine: true,
          // 控制 checkbox 选择框是在前面还是后面
          controlAffinity: ListTileControlAffinity.leading,
          // 是否将主题色应用到文字或者图标
          selected: true,
          onChanged: (checked) {
            setState(() => _isTitleChecked = checked);
          },
        ),
        SwitchListTile(
            title: Text('Turn On this item'),
            subtitle: Text('description...description...\ndescription...description...'),
            secondary: Image.asset('images/ali.jpg', width: 30.0, height: 30.0),
            isThreeLine: true,
            value: _isTitleOn,
            selected: true,
            onChanged: (onState) {
              setState(() => _isTitleOn = onState);
            })
          ],
        )
      ),
      drawer: Drawer(
        child:SafeArea(child: Container(
          child: Text('Drawer', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30.0)),
        ),)
      ),
     );
  }
}