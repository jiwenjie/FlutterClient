import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/bloc/banner_bloc.dart';
import 'package:flutter_client/bloc/bloc_provider.dart';
import 'package:flutter_client/bloc/home_list_bloc.dart';
import 'package:flutter_client/components/pagination.dart';
import 'package:flutter_client/model/story.dart';
import 'package:flutter_client/model/wanandroid.dart';

// 首页
class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

// 仿照 FlutterGo 中的自定义 banner 组件
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int page = 1;
  bool showToTopBtn = true; //是否显示“返回到顶部”按钮

  //listview控制器
  ScrollController _scrollController = ScrollController();
  HomeListBloc _beanListBloc;

  //获取文章列表数据
  Future<Null> _refresh() async {

  }

  // 上拉加载更多方法
  void _getMore() {
    page++;
    _beanListBloc
        .requestIndexList(page)
        .then((model) => _beanListBloc.updateListPage(page, model.bean.datas));
  }

  // Item 的点击事件
  void onItemClicke(DatasBaen bean) {
    print('点击了' + bean.title);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //滑到了底部，加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑到了底部，加载更多');
        _getMore();
      }

      //当前位置是否超过屏幕高度
      if (_scrollController.offset < 200 && showToTopBtn) {
        setState(() {
//          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 200 && showToTopBtn == false) {
        setState(() {
//          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _bannerBloc = BlocProvider.of<BannerBloc>(context);
    _beanListBloc = BlocProvider.of<HomeListBloc>(context);
    _bannerBloc
        .requestBannerList()
        .then((urlList) => _bannerBloc.updateBanner(urlList));
    _beanListBloc
        .requestIndexList(page)
        .then((model) => _beanListBloc.updateListPage(page, model.bean.datas));

    return RefreshIndicator(
      displacement: 15,
      onRefresh: _refresh,
      child: Scaffold(
        body: StreamBuilder(
            initialData: _bannerBloc.storyList,
            stream: _bannerBloc.storyStream,
            builder: (_, AsyncSnapshot<List<StoryModel>> urlSnapshot) =>
                StreamBuilder(
                  initialData: _beanListBloc.wanDataList,
                  stream: _beanListBloc.wanBaseModelStream,
                  builder: (_, AsyncSnapshot<List<DatasBaen>> snop) =>
                  !urlSnapshot.hasData || urlSnapshot.data.isEmpty || !snop.hasData
                      ? Center(child: CupertinoActivityIndicator(radius: 12.0),)
                      : CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      // 这里需要传入 `Sliver` 部件
                      SliverToBoxAdapter(
                          child: Container(
                              color: Colors.black12,
                              child: Column(
                                  children: <Widget>[
                                    Divider(height: 2.0, color: Colors.black54),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Pagination(urlSnapshot.data), // 传入 url 链接
                                      ],
                                    ),
                                    Divider(height: 2.0, color: Colors.black54),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
                              alignment: Alignment.center)),
                      // SliverList 的实现和 SliverFixedExtentList 以及 List.custom 实现类似，不过它不用指定高度
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (_, index) => InkWell(
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                                      child: Row(
                                        children: <Widget>[
                                          Text(snop.data[index].author, style: TextStyle(fontSize: 12), textAlign: TextAlign.left,),
                                          Expanded(
                                            child: Text(snop.data[index].niceDate, style: TextStyle(fontSize: 12), textAlign: TextAlign.right,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(snop.data[index].title, maxLines: 2,
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                                                color: const Color(0xFF3D4E5F),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(snop.data[index].superChapterName, style: TextStyle(fontSize: 12), textAlign: TextAlign.left,),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                onItemClicke(snop.data[index]);
                              },
                            ),
                            childCount: snop.data.length),
                      ),
                    ],
                  ),
                )),
        floatingActionButton: !showToTopBtn
            ? null : FloatingActionButton(
            child: Icon(Icons.arrow_upward),
            onPressed: () {
              //返回到顶部时执行动画
              _scrollController.animateTo(.0,
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            }),
      ),
    );
  }
}
