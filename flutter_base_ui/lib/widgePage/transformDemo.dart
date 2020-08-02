import 'package:flutter/material.dart';
class TransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(80),
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
          ),
           DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素  
              child: Transform.translate(
                offset: Offset(-20.0, -5.0),
                child: Text("Hello world"),
              ),
            ),
            DecoratedBox(
            decoration:BoxDecoration(color: Colors.red),
            child: Transform.scale(
                scale: 1.5, //放大到1.5倍
                child: Text("Hello world")
            )
            ),

        ],
      ),
    );
    
  }
}