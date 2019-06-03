


import 'package:fluro/fluro.dart';
import 'package:flutter_client/page/splash_page.dart';
import 'package:flutter_client/utils/logger.dart';

Handler notFoundHandler = Handler(handlerFunc: (_, params) {
  Logger('RouterHandler:').log('Not Found Router');
});

Handler rootHandler = Handler(handlerFunc: (_, params) => SplashPage());
