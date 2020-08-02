import 'package:flutter/material.dart';

class Product {
  String proName;
  String proDec;
  Product(this.proName,this.proDec);
}
class PushDemoParamsPage extends StatelessWidget {
  _gotoProductDetail(BuildContext context,Product pro) async{
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(pro: pro)),
    );
    Scaffold.of(context).showSnackBar(SnackBar(content:Text("$result"))
    );
  }
  final List<Product>productList;
  PushDemoParamsPage({Key key,@required this.productList}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品列表"),),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            title: Text(this.productList[index].proName),
            onTap: (){
              _gotoProductDetail(context, this.productList[index]);
            },
          );
      }),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product pro;
  ProductDetail({Key key,@required this.pro}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(this.pro.proName)),
      body: Column(
        children: <Widget>[
          Text(this.pro.proDec),
          RaisedButton(child:Text("返回"), onPressed: (){
            String proName = this.pro.proName;
            Navigator.pop(context,"我从($proName)返回");
          })
        ],
      )
    );
  }
}