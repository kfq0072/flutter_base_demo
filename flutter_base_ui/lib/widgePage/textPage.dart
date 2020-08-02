import 'package:flutter/material.dart';
class TextPageWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text("背景，红色字,放大倍数",style:TextStyle(
              color:Colors.red,
              background:Paint()..color=Colors.green),
              textScaleFactor: 2,),
            Text("下划线下划线下划线下划线",style: TextStyle(
              decoration:TextDecoration.underline,),),
            Text("中划线中划线中划线中划线",style: TextStyle(decoration:TextDecoration.lineThrough,),),
            Text("省略样式省略样式省略样式"*4,maxLines:1,overflow:TextOverflow.ellipsis),
            Text.rich(TextSpan(
              children:[
                TextSpan(text: "富文本:"),
                TextSpan(text:"https://wwww.baidu.com",style: TextStyle(color:Colors.blue),
                // recognizer: GestureDetector()
                ),
              ]
            )),

            DefaultTextStyle(style: TextStyle(color:Colors.red,fontSize:20),
            textAlign: TextAlign.start,
             child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("DefaultTextStyle1111"),
                      Text("DefaultTextStyle222222"),
                      Text("DefaultTextStyle 被自身的覆盖",
                        style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey
                        ),
                      ),
                    ],
             ))
          ]
        )
      ),
    );
  }
}