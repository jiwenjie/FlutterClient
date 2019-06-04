import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/utils/http_utils.dart';

class Application {
  static HttpUtils http;  // 全局网络请求
  static Router router;   // 全局路由
  static TabController controller;
}