import 'package:flutter/material.dart';
import 'package:flutter_client/components/home_banner.dart';
import 'package:flutter_client/model/story.dart';
import 'package:url_launcher/url_launcher.dart';

// pagination 分页组件
class Pagination extends StatelessWidget {

  Pagination(this.arr, {Key key}) : super(key: key);

  List<dynamic> arr = [];

  static final String routeName = '/material/page-selector';

  static final List<Icon> icons = <Icon>[
    const Icon(
      Icons.event,
      semanticLabel: 'Event',
    ),
    const Icon(
      Icons.home,
      semanticLabel: 'Home',
    ),
    const Icon(
      Icons.android,
      semanticLabel: 'Android',
    ),
    const Icon(
      Icons.alarm,
      semanticLabel: 'Alarm',
    ),
    const Icon(
      Icons.face,
      semanticLabel: 'Face',
    ),
    const Icon(
      Icons.language,
      semanticLabel: 'Language',
    ),
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 界面选择方法
  List<Widget> _pageSelector(BuildContext context) {
    List<Widget> list = [];
    List<StoryModel> bannerStories = [];

    /// super.initState();
    arr.forEach((item) {    /// todo 这里需要注意网络请求成功之后赋值就已经是 List<StoryModel> 了，不必再次解析
      bannerStories.add(item);
    });

    if (arr.length > 0) {
      list.add(CommonBanner(bannerStories, (story) {
        _launchURL('${story.url}');
      }));
    }
    return list;
  }

  // 提供设置 url 的方法
  Pagination setUrlList(List<dynamic> urlList) {
    this.arr = urlList;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        key: Key('__header__'),
        //physics: AlwaysScrollableScrollPhysics(),
        //padding: EdgeInsets.only(),
        children: _pageSelector(context));
  }
}
