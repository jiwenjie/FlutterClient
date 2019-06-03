
import 'package:fluro/fluro.dart';
import 'package:flutter_client/routers/handler.dart';

/// fluro 路由管理类
class Routers {
  static const root = '/';

  static configureRouters(Router router) {
    router.notFoundHandler = notFoundHandler;

    router.define(root, handler: rootHandler);
  }
}