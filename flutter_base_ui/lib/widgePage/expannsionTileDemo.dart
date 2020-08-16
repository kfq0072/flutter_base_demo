import 'package:flutter/material.dart';

class ExpannsionTileDemo extends StatefulWidget {
  @override
  _ExpannsionTileDemoState createState() => _ExpannsionTileDemoState();
}

class _ExpannsionTileDemoState extends State<ExpannsionTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.yellow,
      body: Center(
        child:Container(
          color:Colors.greenAccent,
          child:ExpansionTile(
          title: Text('Expansion tile'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.redAccent,
          children: <Widget>[
            ListTile(
              title:Text('List title'),
              subtitle:Text('subtitle')
            ),
          ],
          initiallyExpanded: true,
        )
        )
      ),
    );
  }
}