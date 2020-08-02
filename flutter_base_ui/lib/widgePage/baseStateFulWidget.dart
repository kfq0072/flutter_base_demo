import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class BaseStatefulWidget extends StatefulWidget {
  
  BaseStatefulWidget({@required this.effecWidget,this.resourceFileName});
  Widget effecWidget;
  final String resourceFileName;

  @override
  _BaseStatefulWidgetState createState() => _BaseStatefulWidgetState();
}

class _BaseStatefulWidgetState extends State<BaseStatefulWidget> {
  int _currentIndex = 0;
  List<Widget>_bodyList = [];
  

  @override
  void initState() {
    // TODO: implement initState
    if (widget.effecWidget == null){
      widget.effecWidget = Center(
        child:Text("正在编写中")
      );
    }
    _bodyList..add(widget.effecWidget)..add(DocmentViewFile(fileName: widget.resourceFileName,));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('GridView Demo'),
      // ),
        bottomNavigationBar: BottomNavigationBar(items: [
           BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('UI'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              title: Text('Docment')
            ), 
        ],
        onTap: (int index){
           setState((){
             _currentIndex= index;
           });
          },
        currentIndex: _currentIndex,
        ),
      body:_bodyList[_currentIndex] ,
    );
  }
}

class DocmentViewFile extends StatefulWidget {
  final String fileName;
  DocmentViewFile({@required this.fileName});
  @override
  _DocmentViewFileState createState() => _DocmentViewFileState();
}

class _DocmentViewFileState extends State<DocmentViewFile> {
    Future<String> loadAsset(String fileName) async {
    var a = await rootBundle.loadString(fileName);
    return a;
}
  var _result = "";
 dynamic result;
 void loadAssests(String fileName) async {
 result = await loadAsset(fileName);
 print(result);
 setState(() {
   _result = result.toString();
     });
   }
   
@override
void initState() {
  String name = widget.fileName;
 loadAssests('resourceFile/$name');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
      child: Text(_result),
    )
    );
  }
}


