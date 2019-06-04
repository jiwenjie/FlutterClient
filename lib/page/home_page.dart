import 'package:flutter/material.dart';
import 'package:flutter_client/components/pagination.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; // 引入头文件

// 首页
class HomeScreen extends StatefulWidget {

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // 声明一个list，存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {
    // TODO: implement initState
    imageList
      ..add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Colors.black12,
//        appBar: AppBar(
//          title: Text('轮播图'),
//        ),
//        body: ListView(
//          // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
//          children: <Widget>[firstSwiperView()],
//        ));
        body: Container(
         child: Pagination(),
        )
    );
  }


  /// 暂时先使用这个轮播图。有更好的替换
  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
      width: MediaQuery.of(context).size.width,
      height: 300,
      // first Style
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            // 用Container实现图片圆角的效果
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: imageList[index], // 图片数组
//                fit: BoxFit.cover,
//              ),
//              borderRadius: BorderRadius.all(
//                Radius.circular(10.0),
//              ),
//            ),
//          );
//        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
//        pagination:  SwiperPagination(
//            builder: DotSwiperPaginationBuilder(
//                color: Colors.white70,              // 其他点的颜色
//                activeColor: Colors.redAccent,      // 当前点的颜色
//                space: 2,                           // 点与点之间的距离
//                activeSize: 20                      // 当前点的大小
//            )
//        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),

      // 第二种样式
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}