import 'package:flutter/material.dart';
import 'package:flutter_client/page/four_page.dart';
import 'package:flutter_client/page/home_page.dart';
import 'package:flutter_client/page/second_page.dart';
import 'package:flutter_client/page/third_page.dart';

// 底部控制栏该界面的不同 tab 页对应的状态是可以保持的
class NavigationKeepAlive extends StatefulWidget {
  @override
  _NavigationKeepAliveState createState() => _NavigationKeepAliveState();
}

class _NavigationKeepAliveState extends State<NavigationKeepAlive>
    with SingleTickerProviderStateMixin {

  int _currentIndex = 0;

  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // 测试 Text 的点击事件
  void leftClick() {
    print('点击了取消');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          FirstScreen(),
          SecondScreen(),
          ThirdScreen(),
          FourScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
//          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
//                color: _bottomNavigationColor,
              ),
              title: Text(
                'HOME',
//                style: TextStyle(color: _bottomNavigationColor),
              ),
//            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
//                color: Colors.grey,
              ),
              title: Text(
                'Email',
//                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
//                color: _bottomNavigationColor,
              ),
              title: Text(
                'PAGES',
//                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
//                color: _bottomNavigationColor,
              ),
              title: Text(
                'AIRPLAY',
//                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
      ),
    );
  }
}
