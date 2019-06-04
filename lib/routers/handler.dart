import 'package:fluro/fluro.dart';
import 'package:flutter_client/page/bottom_page.dart';
import 'package:flutter_client/page/splash_page.dart';
import 'package:flutter_client/page/tabview_bottom.dart';
import 'package:flutter_client/utils/logger.dart';

Handler notFoundHandler = Handler(handlerFunc: (_, params) {
  Logger('RouterHandler:').log('Not Found Router');
});

Handler rootHandler = Handler(handlerFunc: (_, params) => SplashPage());

Handler indexHandler = Handler(handlerFunc: (_, params) => NavigationKeepAlive());


/// 测试跳转界面
Handler testIndex = Handler(handlerFunc: (_, params) => AppPage());
