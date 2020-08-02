import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage({this.goodsId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child:Text(this.goodsId)
      ),
    );
  }
}