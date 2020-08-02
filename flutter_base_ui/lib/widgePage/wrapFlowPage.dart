import 'package:flutter/material.dart';

class WrapFlowPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warp Demo"),
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        child:Column(
          children:[
             Wrap(children: <Widget>[
                for (String item in tags) TagItem(item)
              ]),
            
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: <Widget>[
                new Container(width: 80.0, height:80.0, color: Colors.red,),
                new Container(width: 80.0, height:80.0, color: Colors.green,),
                new Container(width: 80.0, height:80.0, color: Colors.blue,),
                new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
                new Container(width: 80.0, height:80.0, color: Colors.brown,),
                new Container(width: 80.0, height:80.0,  color: Colors.purple,),
              ],
            )
          ]
        ) 
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  final String text;

  TagItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border:  Border.all(color: Colors.blueAccent.withAlpha(60), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }
}

const List<String> tags = [
  "肯德基",
  "小哥哥你的东西掉了",
  "小姐姐好漂亮啊",
  "这个东西是啥",
  "哈哈哈",
  "好困啊",
  "今天好运",
  "明天好运来",
  "今年快结束了",
  "我累啊",
  "你写的什么代码",
  "多多多"
];


class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

