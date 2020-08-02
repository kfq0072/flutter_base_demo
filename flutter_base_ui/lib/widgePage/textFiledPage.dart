import 'package:flutter/material.dart';

class TextFiledPage extends StatefulWidget {
  @override
  _TextFiledPageState createState() => _TextFiledPageState();
}

class _TextFiledPageState extends State<TextFiledPage> {

  TextEditingController _editconter = TextEditingController();
  FocusNode _editNode = FocusNode();
  // 保存按钮点击后的输入内容值
  String _content = '';
  // 监听输入内容变化的内容值
  String _spyContent = '';

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child:Column(
          children: <Widget>[
            TextField(
              controller: _editconter,
              decoration: InputDecoration(
                icon:Icon(Icons.phone_iphone),
                labelText:'请输入手机号',
                 helperText: '手机号',
                  hintText: '手机号...在这儿输入呢',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              maxLength: 11,
              maxLengthEnforced: true,
              onChanged: (v){
                setState(() {
                  _spyContent = v;
                });
              },

              onSubmitted: (s){
                setState(() {
                  _spyContent = _editconter.value.text;
                });
              },
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child:  RaisedButton(
                onPressed: (){
                setState(() {
                  _content = _editconter.value.text;
                  _editconter.clear();
                });
                setState(() {
                    _spyContent="";
                  });
                },
              child: Text("获取输入的内容"),
              ),
            ),
           Text(_content.isEmpty?"输入:$_spyContent":"没有任何内容"),

           Padding(padding: 
           const EdgeInsets.only(top:8),
           child: Text("监听者:$_spyContent"),
           ),
           
          ],
        )
      ),
    );
  }
}