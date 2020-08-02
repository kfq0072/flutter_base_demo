import 'package:flutter/material.dart';

class WarpPicDemo extends StatefulWidget {
  final String _pageTitle;
  WarpPicDemo(@required this._pageTitle);
  @override
  _WarpPicDemoState createState() => _WarpPicDemoState();
}

class _WarpPicDemoState extends State<WarpPicDemo> {

  List<Widget>_list=[];

 Widget buildAddButton(){
    //返回一个手势Widget，只用用于显示事件
    return  GestureDetector(
      onTap:(){
        if(_list.length<9){
          setState(() {
                _list.insert(_list.length-1,buildPhoto(_list.length-1));
          });
        }
      },
      child: Padding(
        padding:const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }


Widget buildPhoto(int index){
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
      width:80,
      height:80,
      color:Colors.amber,
      child:Center(child: Text("照片${index}"),
      )
    ),
  );
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list
    ..add(buildAddButton());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._pageTitle),
      ),
      body: Container(
        child:Wrap(
          spacing:26,
          children:_list
        )
      ),
    );
  }
}

