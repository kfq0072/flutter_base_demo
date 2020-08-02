import 'package:flutter/material.dart';
import '../tool/pageManager.dart';
class UiListPage extends StatelessWidget {
    final List<String>items = PageManager().items;
    _onTapListTile(String text, BuildContext context) async{ //async是启用异步方法
    var widgetPage =PageManager().getWidgetPage(text);
    final result = await Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=> widgetPage));
    if (result !=null) {
      Scaffold.of(context).showSnackBar(SnackBar(content:Text('$result')));
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text('${items[index]}'),
              onTap: (){
                _onTapListTile('${items[index]}',context);
              },
              );
          },
        ),
      );
  }
}