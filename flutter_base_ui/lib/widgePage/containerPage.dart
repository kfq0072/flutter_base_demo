import 'package:flutter/material.dart';

class ContainnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start,//因为是列，所以这个属性就控制垂直向了
        crossAxisAlignment: CrossAxisAlignment.start,//因为是列，所以这个属性就控制水平向了
        children:[
          Container(
            // alignment: Alignment.center,
            // 宽，高度同上层容器相同
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            width:200,
            height:200,
            margin: const EdgeInsets.all(8.0),//控制本身，对外的组件
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),//控制子组件
            child:Text('妹子妹子', style: TextStyle(color: Colors.white, fontSize: 30.0,backgroundColor: Colors.red)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
                color: Colors.red,
                backgroundBlendMode: BlendMode.colorDodge, // 背景图片和颜色混合模式
                image: DecorationImage(image: AssetImage('images/meizi.jpeg'), fit: BoxFit.cover)
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10.0, left: 120.0,bottom:40), //容器外填充
              constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
              decoration: BoxDecoration(//背景装饰
                  gradient: RadialGradient( //背景径向渐变
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98
                  ),
                  boxShadow: [ //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0
                    )
                  ]
              ),
              transform: Matrix4.rotationZ(.2), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: Text( //卡片文字
                "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
          ),
      Container(
        margin: EdgeInsets.all(10.0), //容器外补白
        color: Colors.orange,
        child: Text("Hello world!"),
      ),
      Container(
        padding: EdgeInsets.all(20.0), //容器内补白
        color: Colors.orange,
        child: Text("Hello world!"),
      ),
        ]
      )
    );
  }
}