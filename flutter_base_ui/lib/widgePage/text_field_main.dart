import 'package:flutter/material.dart';

class TextFieldDemoPage extends StatefulWidget {
  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  // 可以传入初始值
  TextEditingController _editController = TextEditingController();
  FocusNode _editNode = FocusNode();
  String _content = '';
  String _spyContent = '';

  @override
  void initState() {
    super.initState();

    _editNode.addListener(() {
      print('edit has focus? => ${_editNode.hasFocus}');
    });
  }

  @override
  void dispose() {
    // 记得销毁
    _editController.dispose();
    _editNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Content'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _editController,
                focusNode: _editNode,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone_iphone, color: Theme.of(context).primaryColor),
                    labelText: '请输入手机号',
                    helperText: '手机号',
                    hintText: '手机号...在这儿输入呢'),
                keyboardType: TextInputType.number,
                // 输入类型为数字类型
                textInputAction: TextInputAction.done,
                style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
                textDirection: TextDirection.ltr,
                maxLength: 11,
                // 最大长度为 11
                maxLengthEnforced: true,
                // 超过长度的不显示
                onChanged: (v) {
                  // 输入的内容发生改变会调用
                  setState(() => _spyContent = v);
                },
                onSubmitted: (s) {
                  // 点击确定按钮时候会调用
                  setState(() => _spyContent = _editController.value.text);
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RaisedButton(
                      onPressed: () {
                        // 获取输入的内容
                        setState(() => _content = _editController.value.text);
                        // 清理输入内容
                        _editController.clear();
                        setState(() => _spyContent = '');
                      },
                      child: Text('获取输入内容'))),
              // 展示输入的内容，点击按钮会显示
              Text(_content.isNotEmpty ? '获取到输入内容: $_content' : '还未获取到任何内容...'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                // 监听输入内容的变化，会跟随输入的内容进行改变
                child: Text('我是文字内容监听：$_spyContent'),
              ),
              Column(
             children:[
               TextField(autofocus: true, 
                          focusNode: focusNode1,//关联focusNode1
                            decoration: InputDecoration(
                            labelText: "input1"),
                        ),
              TextField(
            focusNode: focusNode2,//关联focusNode2
            decoration: InputDecoration(
                labelText: "input2"
            ),
          ),
             ]
           ),
           Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起  
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
               },
          ),
            ],
          )),
    );
  }
}
