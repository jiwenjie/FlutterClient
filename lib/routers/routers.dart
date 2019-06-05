import 'package:fluro/fluro.dart';
import 'package:flutter_client/routers/handler.dart';

/// fluro 路由管理类
class Routers {
  static const root = '/';    // 项目的根目录（首页）

  static const home_page = '/home_page';

  static const index_page = '/index_page';

  static configureRouters(Router router) {
    router.notFoundHandler = widgetNotFoundHandler;

    router.define(root, handler: rootHandler);

    router.define(home_page, handler: homeHandler);

    router.define(index_page, handler: indexHandler);
  }
}