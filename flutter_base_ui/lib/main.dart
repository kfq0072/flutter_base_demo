import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgePage/uiList.dart';
import 'heightLeve/heightLeveMainPage.dart';
import 'heightLeve/counter.dart';
import 'widgePage/meDrawer.dart';

void main() {
  // final counter = CounterClass();
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       Provider<CounterClass>.value(value: counter)
  //     ],
  //     child: MyApp(),
  //   )
  // );
  runApp(ChangeNotifierProvider<CounterClass>.value(
    notifier: CounterClass(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/MainPage':(_)=>MainPage(),
        '/page_b':(_)=>BPage(),
        '/page_c':(params)=>CPage(title: "c page title")
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PushDemoParamsPage(productList: this.productList)
      // home: BottomBarPage()
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> pageList = List();

  @override
  void initState() {
    // TODO: implement initState
    pageList
      ..add(UiListPage())
      ..add(HeightLeveMainPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Demo"),
        actions: <Widget>[
            IconButton(icon: Icon(Icons.share), onPressed: (){})
          ],
      ),
      drawer: MeDrawerPage(),
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('base'),
            ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('height')
        ),
      ],
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      currentIndex: _currentIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Provider.of<CounterClass>(context).insersuCount();
        },
        child: Text("加1"),
        ),
    );
  }
}

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class CPage extends StatelessWidget {
   String title;
  CPage({Key key,@required this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

