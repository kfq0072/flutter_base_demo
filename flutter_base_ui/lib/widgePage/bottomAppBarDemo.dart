import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  final String _title;
  EachView(this._title);
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget._title)),
      body: Center(child:Text(widget._title)),
    );
  }
}
class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {

  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView = List();
    _eachView..add(EachView('Home'))..add(EachView('Me'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return EachView('New page');
        }));
      },
      tooltip: 'Increment',
      child: Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color:Colors.lightBlue,
        shape:CircularNotchedRectangle(),
        child:Row(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home), onPressed: (){
                setState(() {
                  _index = 0;
                });
              },color: Colors.white,),
              IconButton(icon: Icon(Icons.airport_shuttle), onPressed: (){
                setState(() {
                  _index = 1;
                });
              },color:Colors.white)
            ],
        )
      ),
    );
  }
}