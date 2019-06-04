import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/page/bottom_page.dart';
import 'package:flutter_client/page/splash_page.dart';
import 'package:flutter_client/page/tabview_bottom.dart';
import 'package:flutter_client/utils/logger.dart';
import 'package:flutter_client/widgets/404.dart';

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return WidgetNotFound();
    });

Handler rootHandler = Handler(handlerFunc: (_, params) => SplashPage());

Handler indexHandler = Handler(handlerFunc: (_, params) => NavigationKeepAlive());


/// 测试跳转界面
Handler testIndex = Handler(handlerFunc: (_, params) => AppPage());
