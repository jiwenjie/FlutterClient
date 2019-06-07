import 'package:flutter/material.dart';
import 'package:flutter_client/bloc/bloc_provider.dart';
import 'package:flutter_client/bloc/settings_bloc.dart';
import 'package:flutter_client/configs/application.dart';
import 'package:flutter_client/page/four_page.dart';
import 'package:flutter_client/page/home_page.dart';
import 'package:flutter_client/page/search/search_page.dart';
import 'package:flutter_client/page/second_page.dart';
import 'package:flutter_client/page/third_page.dart';

const int ThemeColor = 0xFFC91B3A;

//使用 tabView 实现底部菜单栏
class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  String appBarTitle = tabData[0]['text'];

  static List tabData = [
    {'text': '业界动态', 'icon': Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
    {'text': '组件收藏', 'icon': Icon(Icons.favorite)},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts)}
  ];

  List<Widget> myTabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new TabController(
        initialIndex: 0, vsync: this, length: 4); // 这里的length 决定有多少个底导 submenus

    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(new Tab(text: tabData[i]['text'], icon: tabData[i]['icon']));
    }
    // 添加点击 tab 切换监听
    controller.addListener(() {
      if (controller.indexIsChanging) {
        _onTabChange();
      }
    });
    Application.controller = controller;
  }

  void _onTabChange() {
    if (this.mounted) {
      this.setState(() {
        appBarTitle = tabData[controller.index]['text'];
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<SettingBloc>(context);

    // add StreamBuilder 可以动态全局修改应用的主题色
    return WillPopScope(
        // 导航返回拦截控件 WillPopScope
        onWillPop: _onWillPop,
        child: StreamBuilder(
            stream: _bloc.colorStream,
            initialData: _bloc.color,
            builder: (_, AsyncSnapshot<Color> snapshot) => Theme(
                data: ThemeData(
//                primarySwatch: snapshot.data,   // 必须是 MaterialColor，这里暂不使用
                    primaryColor: snapshot.data, // 决定导航栏颜色
                    accentColor: snapshot.data, // 次级色，决定大多数 widget 的颜色
                    iconTheme: IconThemeData(color: snapshot.data)),
                child: Scaffold(
                  appBar: AppBar(
                    title: new Text(tabData[controller.index]['text']),
                    // 根据当前的位置索引改变标题
                    bottom: null,
                    elevation: 0,
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SearchPage();
                            }));
                          })
                    ],
                  ),
                  body: TabBarView(controller: controller, children: <Widget>[
                    HomeScreen(),
                    SecondScreen(),
                    ThirdScreen(),
                    FourScreen(),
                  ]),
                  bottomNavigationBar: Material(
                    color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
                    child: SafeArea(
                      child: Container(
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0xFFd0d0d0),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                              offset: Offset(-1.0, -1.0),
                            ),
                          ],
                        ),
                        child: TabBar(
                            controller: controller,
                            indicatorColor: snapshot.data,
                            //tab标签的下划线颜色
                            // labelColor: const Color(0xFF000000),
                            indicatorWeight: 3.0,
//                        labelColor: snapshot.data,
                            labelColor: snapshot.data,
                            unselectedLabelColor: const Color(0xFF8E8E8E),
                            tabs: myTabs),
                      ),
                    ),
                  ),
                ))));
  }

  // 首页点击返回会弹出提示框
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('இ௰இ'),
                content: new Text('真的要走了吗，不再多陪我一会(●◡●)'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('在陪一会'),
                  ),
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text('狠心离开'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  /// 这里是封装的搜索框，所有可拆分的组件单独放在一个包下。组件化
//  Widget buildSearchInput(BuildContext context) {
//    return new SearchInput((value) async {
//      if (value != '') {
//        List<WidgetPoint> list = await widgetControl.search(value);
//
//        return list
//            .map((item) => new MaterialSearchResult<String>(
//          value: item.name,
//          icon: WidgetName2Icon.icons[item.name] ?? null,
//          text: 'widget',
//          onTap: () {
//            onWidgetTap(item, context);
//          },
//        ))
//            .toList();
//      } else {
//        return null;
//      }
//    }, (value) {}, () {});
//  }
}
