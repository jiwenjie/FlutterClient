
// BloC 基类，所有的数据管理都需要继承
import 'package:flutter/material.dart';

abstract class BaseBloc {
  void dispose();
}

/// Bloc 控件，在使用数据类管理前需要通过该控件注册管理类
/// 如果是全局使用的 BloC 则注册在 MaterialApp 上层
/// 非全局的 BloC 建议注册在路由
class BlocProvider<T extends BaseBloc> extends StatefulWidget {

  final Widget child;
  final T bloc;

  BlocProvider({Key key, @required this.bloc, @required this.child}) : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}



