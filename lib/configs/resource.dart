/// 在 pubspec 注册的资源文件(包括但不限于图片，字体)建议通过 R 类来管理路径
/// 防止重复手写出现拼写错误
class Resource {
  static const pngSplash = 'assets/images/splash.png';
  static const splashLogo = 'assets/images/logo.jpg';

  static const errImgPath = 'assets/images/ic_error.png';
  static const emptyImgPath = 'assets/images/ic_empty.png';
}

// todo 解决了官方demo里路由跳转效果卡顿的问题
//Navigator.of(context).push(new PageRouteBuilder(
//opaque: false,
//pageBuilder: (BuildContext context, _, __) {
//return new CompanyDetail(company);
//},
//transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
//return new FadeTransition(
//opacity: animation,
//child: new SlideTransition(position: new Tween<Offset>(
//begin: const Offset(0.0, 1.0),
//end: Offset.zero,
//).animate(animation), child: child),
//);
//}
//));
