// wanandroid 的程序主体界面

import 'package:flutter/material.dart';
import 'package:flutter_client/bloc/bloc_provider.dart';
import 'package:flutter_client/bloc/settings_bloc.dart';
import 'package:flutter_client/configs/application.dart';

class WanandroidApp extends StatelessWidget {
  // 用的比较多的 Bloc 注册在最上层，否则的话在路由跳转注册就可以
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: SettingBloc(),  // 主题色切换 BLoC
      child: MaterialApp(
        title: 'Wanandroid App',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

