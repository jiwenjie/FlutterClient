import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/bloc/banner_bloc.dart';
import 'package:flutter_client/bloc/bloc_provider.dart';
import 'package:flutter_client/bloc/home_list_bloc.dart';
import 'package:flutter_client/page/bottom_page.dart';
import 'package:flutter_client/page/splash_page.dart';
import 'package:flutter_client/page/tabview_bottom.dart';
import 'package:flutter_client/widgets/404.dart';

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return WidgetNotFound();
    });

Handler rootHandler = Handler(handlerFunc: (_, params) => SplashPage());

Handler homeHandler = Handler(handlerFunc: (_, params) => NavigationKeepAlive());

/// 跳转 Main 界面
Handler indexHandler = Handler(handlerFunc: (_, params){
  return BlocProvider(bloc: HomeListBloc(), child: BlocProvider(child: AppPage(), bloc: BannerBloc()));
});
