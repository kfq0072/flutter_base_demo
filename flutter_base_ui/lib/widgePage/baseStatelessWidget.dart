import 'package:flutter/material.dart';
class baseStatelessWidget extends StatelessWidget {
  final String appBarTitle;
 baseStatelessWidget({Key key,@required this.appBarTitle}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(this.appBarTitle)),

    );
  }
}