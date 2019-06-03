import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_client/configs/application.dart';
import 'package:flutter_client/routers/routers.dart';
import 'package:flutter_client/utils/api.dart';
import 'package:flutter_client/utils/http_utils.dart';
import 'package:flutter_client/wanandroid_app.dart';

void main() {
  // 注册 fluro router
  Router router = Router();
  Routers.configureRouters(router);
  Application.router = router;

  // 初始化 http
  Application.http = HttpUtils(baseUrl: NetApi.WANANDROID_BASE);

  // 强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(WanandroidApp());

    // 判断如果是 Android 系统的话把状态栏设置透明
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    }
  });
}

