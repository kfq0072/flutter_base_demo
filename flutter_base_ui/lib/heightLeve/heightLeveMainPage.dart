import 'package:flutter/material.dart';
import 'package:flutter_base_ui/widgePage/buttonPage.dart';
import '../heightLeve/counter.dart';
import 'package:provider/provider.dart';

class HeightLeveMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          children:[
          //  Text("${Provider.of<CounterClass>(context).value}",style: TextStyle(fontSize:24),),
          //   Padding(padding: const EdgeInsets.only(top:50),
          //     child: ButtonPage(),
          //   )
          Text("开发中")
          ]
        )
      ),
    );
  }
}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provider.of<CounterClass>(context).jianyi();
        },
        child: Text("加-1"),
        ),
    );
  }
}