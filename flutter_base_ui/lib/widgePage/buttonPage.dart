import 'package:flutter/material.dart';


class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(0),
        alignment: Alignment.center,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print('This is a Rased Button can be clicked');
              },
              child: Text('Raised Enable,阴影'),
                elevation : 20.0, //正常状态下的阴影
                highlightElevation : 108.0,//按下时的阴影
                disabledElevation : 0.0,// 禁用时的阴影
            ),
            RaisedButton( onPressed: null, child: Text('Raised Disable')),
            RaisedButton.icon( icon: Icon(Icons.send),label: Text("带文字和icon的"),onPressed: null),
            FlatButton(
              onPressed: () => print('This is a Flat Button can be clicker'),
              child: Text('Flat Enable'),
            ),
            FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Flat disable，圆角"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {},
        ),

            IconButton(icon: Icon(Icons.android), onPressed: () {}),
            IconButton(icon: Icon(Icons.android), onPressed: null),
            MaterialButton(onPressed: () {}, child: Text('Material Enable')),
            MaterialButton(onPressed: null, child: Text('Material Disable')),
            OutlineButton(onPressed: () {}, child: Text('Outline Enable')),
            OutlineButton(onPressed: null, child: Text('Outline Disable')),
          ],
        )
      ),
      floatingActionButton:  FloatingActionButton.extended(onPressed: () {}, icon: Icon(Icons.android), label: Text('Android')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}