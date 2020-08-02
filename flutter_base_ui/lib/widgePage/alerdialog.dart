import 'package:flutter/material.dart';
// import 'paatci';

class AletDialogPage extends StatefulWidget {
  @override
  _AletDialogPageState createState() => _AletDialogPageState();
}

class _AletDialogPageState extends State<AletDialogPage> {

Future<void> showListDialog() async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
              child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          )),
        ],
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

  Future<void> changeLanguage() async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

  Future<bool>showDeleteConfirmDialog1(){
    return showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text("remind"),
          content: Text("you want to delete files?"),
          actions: <Widget>[
            FlatButton(onPressed: ()=>Navigator.of(context).pop()
            , child:Text(
              "cancel"
            )
             ),
             FlatButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("ok"))
          ],
        );
      }
    );
  }

  // 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet() {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

// 返回的是一个controller
PersistentBottomSheetController<int> _showBottomSheet() {
  return showBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: (){
              // do something
              print("$index");
              Navigator.of(context).pop();
            },
          );
        },
      );
    },
  );
}

showLoadingDialog() {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

Future<DateTime> _showDatePicker1() {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add( //未来30天可选
      Duration(days: 30),
    ),
  );
}

// Future<DateTime> _showDatePicker2() {
//   var date = DateTime.now();
//   return showCupertinoModalPopup(
//     context: context,
//     builder: (ctx) {
//       return SizedBox(
//         height: 200,
//         child: CupertinoDatePicker(
//           mode: CupertinoDatePickerMode.dateAndTime,
//           minimumDate: date,
//           maximumDate: date.add(
//             Duration(days: 30),
//           ),
//           maximumYear: date.year + 1,
//           onDateTimeChanged: (DateTime value) {
//             print(value);
//           },
//         ),
//       );
//     },
//   );
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children:[
          //点击该按钮后弹出对话框
            RaisedButton(
              child: Text("普通对话框"),
              onPressed: () async {
                //弹出对话框并等待其关闭
                bool delete = await showDeleteConfirmDialog1();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  //... 删除文件
                }
              },
            ),

            RaisedButton(
              child: Text("选择对话框"),
              onPressed: ()  {
                changeLanguage();
              },
            ),

             RaisedButton(
              child: Text("列表对话框"),
              onPressed: ()  {
                showListDialog();
              },
            ),

             RaisedButton(
              child: Text("底部菜单列表"),
              onPressed: ()  {
                _showModalBottomSheet();
              },
            ),

             RaisedButton(
              child: Text("全屏底部菜单列表"),
              onPressed: ()  {
                _showBottomSheet();
              },
            ),


             RaisedButton(
              child: Text("Loading框"),
              onPressed: ()  {
                showLoadingDialog();
              },
            ),

             RaisedButton(
              child: Text("ios 风格日历选择"),
              onPressed: ()  {
                showLoadingDialog();
              },
            ),

              RaisedButton(
              child: Text("日历选择"),
              onPressed: ()  {
                _showDatePicker1();
              },
            ),
        ]
      )
    );
  }
}