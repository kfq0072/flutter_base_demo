import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'mailScreen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final Color _bottomColor = Colors.blue;
  final List<Widget>_pageList = [];
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageList
    ..add(HomeScreen())
    ..add(MailScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:Icon(
              Icons.home,
              color: _bottomColor,
              ),
              title: Text(
                'home',
                style:TextStyle(color:_bottomColor)
              )
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.home,
              color: Colors.red,
              ) ,
            title: Text('Email')
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}