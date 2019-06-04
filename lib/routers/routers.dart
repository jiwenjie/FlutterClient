import 'package:fluro/fluro.dart';
import 'package:flutter_client/routers/handler.dart';

/// fluro 路由管理类
class Routers {
  static const root = '/';    // 项目的根目录（首页）

  static const index_page = '/home_page';

  static const test_index_page = '/test_page';

  static configureRouters(Router router) {
    router.notFoundHandler = notFoundHandler;

    router.define(root, handler: rootHandler);

    router.define(index_page, handler: indexHandler);

    router.define(test_index_page, handler: testIndex);
  }
}