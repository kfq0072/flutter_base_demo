import 'package:flutter/material.dart';
class ImagePageWidget extends StatelessWidget {

  final String localImageName = "images/meizi.jpeg";
  final String networkImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582978272257&di=bbbb864119a2349b44494462984db654&imgtype=0&src=http%3A%2F%2F00.minipic.eastday.com%2F20170303%2F20170303094555_7851ce3d965701f3201d4df2dde56592_8.jpeg";
  final String fadeInImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582978939830&di=82d41a4fe0aa2117ffaf1fd98616fb55&imgtype=0&src=http%3A%2F%2F01.minipic.eastday.com%2F20170511%2F20170511132714_a97930c96c5a47884752b81f8a5da89f_6.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Column(
          children:[
            Container(
              child:Tooltip(message: '不要碰我,我怕痒',
            child: Image.asset(this.localImageName,width: 200,height: 200,),
           ),
            ),
           Image.network(networkImageUrl,
                  height: 80.0,
                  // 横向重复
                  repeat: ImageRepeat.repeatX,
                  // MediaQuery.of(context).size 获取到的为上层容器的宽高
                  width: MediaQuery.of(context).size.width),

          // 会优先加载指定的 asset 图片，然后等网络图片读取成功后加载网络图片，会通过渐隐渐现方式展现
              // cover 方式按照较小的边布满，较大的给切割
              // contain 会按照最大的边布满，较小的会被留白
              // fill 会把较大的一边压缩
              // fitHeight, fitWidth 分别按照长宽来布满

          FadeInImage.assetNetwork(placeholder: this.localImageName, image: this.fadeInImageUrl,
          width:100,height:120
          ),
          // Icon 相对属性少了很多，需要传入一个 IconData 实例，flutter 提供了很多图标，
              // 但是实际情况我们需要加入我们自己的图标，这边再埋坑【坑3】
              // size 为图标显示的大小，color 为图标的颜色，这边通过 Theme 获取主题色调
            Icon(Icons.iso,size:80,color:Colors.green)
          ]
        )
      ),
    );
  }
}