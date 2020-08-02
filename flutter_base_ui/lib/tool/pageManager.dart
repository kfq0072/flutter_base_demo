import 'package:flutter/material.dart';

import '../widgePage/buttonPage.dart';
import '../widgePage/textPage.dart';
import '../widgePage/imagePage.dart';
import '../widgePage/appBarPage.dart';
import '../widgePage/checkBoxAndSwitch.dart';
import '../widgePage/column_main.dart';
import '../widgePage/containerPage.dart';
import '../widgePage/wrapPage.dart';
import '../widgePage/text_field_main.dart';
import '../widgePage/loginPage.dart';
import '../widgePage/pushDemoParams.dart';
import '../widgePage/single_child_scroll_main.dart';
import '../widgePage/listview_main.dart';
import '../widgePage/expansion_tile_main.dart';
import '../widgePage/gridview_main.dart';
import '../widgePage/webViewPage.dart';
import '../widgePage/nested_scroll_main.dart';
import '../widgePage/gesture_main.dart';
import '../widgePage/animation_main.dart';
import '../widgePage/baseStateFulWidget.dart';
import '../widgePage/prompt_main.dart';
import 'package:flutter_base_ui/widgePage/warp_pic_demo.dart';
import 'package:flutter_base_ui/widgePage/toolTipDemo.dart';
import '../widgePage/progressIndicatorDemo.dart';
import '../widgePage/decoratedBoxDemo.dart';
import '../widgePage/transformDemo.dart';
import '../heightLeve/FutureBuilderPage.dart';
import '../heightLeve/StreamBuilderPage.dart';
import '../widgePage/alerdialog.dart';

class PageManager {
   List<String>items = ['text',
              'image',
              'container',
              'button',
              'appbar',
              'checkBoxAndSwitchdialog'
              'dialog',
              'rowAndColumn',
              'wrapPage',
              'textFiledPage',
              'progressIndicatorPage',
              'transformDemo',
              'decoratedBoxDemo',
              'loginPage',
              'pushAndPop',
              'SingleChildScrollDemoPage',
               'listView',
               'expansion',
               'GridListPage',
               'WebView',
               'nested_scroll',
                'gesture',
                'animation',
                'SnackBarAndBottomSheetAndDialog',
                'wrapPicPage',
                'toolTipDemo',
                'http',
                'shared_preferences',
                'FutureBuilderPage',
                'StreamBuilderPage',
                'AletDialogPage'
                ];
    
    getWidgetPage(String pageName) {
      Widget WidgetPage;
      
      switch (pageName) {
        case 'text':
          WidgetPage = TextPageWidget();
          break;
        case 'image':
          WidgetPage =ImagePageWidget();
          break;
        case 'appbar':
          WidgetPage = AppBarPage();
          break;
        case 'checkBoxAndSwitchdialog':
          WidgetPage = CheckBoxAndSwitchPage();
          break;
        case 'container':
          WidgetPage =ContainnerPage();
          break;
        case 'rowAndColumn':
          WidgetPage = ColumnDemoPage();
          break;
        case 'wrapPage':
          WidgetPage = WrapPage();
          break;
        case 'textFiledPage':
          WidgetPage = TextFieldDemoPage();
          break;
        case 'progressIndicatorPage':
          WidgetPage = ProgressIndicatorPage();
          break;
        case 'transformDemo':
          WidgetPage = TransformPage();
          break;
         case 'decoratedBoxDemo':
          WidgetPage = DecoratedBoxPage();
          break;
        case 'loginPage':
          WidgetPage = LoginDemoPage();
          break;
        case 'pushAndPop':
          Product pro = Product("产品1", "产品详情");
          Product pro1 = Product("产品2", "产品详情");
          Product pro2 = Product("产品3", "产品详情");
          List<Product>productList = List();
          productList..add(pro)..add(pro1)..add(pro2);
          WidgetPage = PushDemoParamsPage(productList: productList,);
          break;
        case 'SingleChildScrollDemoPage':
          WidgetPage =SingleChildScrollDemoPage();
          break;
        case 'wrapPicPage':
          WidgetPage = WarpPicDemo("照片流水布局");
          break;
        case 'listView':
          WidgetPage =ListViewDemoPage();
          break;
        case 'expansion':
          WidgetPage = ExpansionTilesDemoPage();
          break;
        case 'GridListPage':
          WidgetPage = GridViewDemoPage();
          break;
        case 'WebView':
          WidgetPage = WebViewPage(title: "百度", url: "https://www.baidu.com");
          break;
        case 'nested_scroll':
          WidgetPage = NestedScrollDemoPage();
          break;
        case 'gesture':
          WidgetPage = GestureDemoPage();
          break;
        case 'animation':
          WidgetPage = AnimationDemoPage();
          break;
        case 'SnackBarAndBottomSheetAndDialog':
          WidgetPage = PromptDemoPage();
          break;
        case 'toolTipDemo':
          WidgetPage = ToolTipDemo();
          break;
        case 'http':
          WidgetPage = null;
          break;
        case 'shared_preferences':
          WidgetPage = null;
          break;
        case 'FutureBuilderPage':
          WidgetPage = FutureBuilderPage();
          break;
        case 'StreamBuilderPage':
          WidgetPage = StreamBuilderPage();
          break;
        case 'AletDialogPage':
          WidgetPage = AletDialogPage();
          break;
        default:
          WidgetPage = ButtonPage();
      }
      pageName=pageName+".txt";

      return BaseStatefulWidget(effecWidget: WidgetPage,resourceFileName: pageName);
    }
  
}