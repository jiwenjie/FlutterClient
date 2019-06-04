import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/bloc/bloc_provider.dart';

class SettingBloc extends BaseBloc {
  // 所有的主题色列表     Color 加载颜色，0x开始，FF表示透明度，之后的表示颜色色值
  static const themeColors = [
    Color(0xFFB71C1C),
    Color(0xFFE53935),
    Color(0xFF1E88E5),
    Color(0xFF43A047),
    Color(0xFFF4511E),
    Color(0xFFD81B60),
    Color(0xFF8E24AA)
  ];

  Color _color = themeColors[0];

  bool _sliverHeader = false;

  Color get color => _color;

  bool get sliverHeader => _sliverHeader;

  BehaviorSubject<Color> _colorController = BehaviorSubject();

  BehaviorSubject<bool> _headerController = BehaviorSubject();

  Observable<Color> get colorStream => Observable(_colorController.stream);

  Observable<bool> get headerStream => Observable(_headerController.stream);

  // 切换主题后通知刷新
  switchTheme(int themeIndex) {
    _color = themeColors[themeIndex];
    _colorController.add(_color);
  }

  // 下拉刷新的时候头部是否跟随
  changeSliverState(bool enabled) {
    _sliverHeader = enabled;
    _headerController.add(_sliverHeader);
  }

  @override
  void dispose() {
    _colorController?.close();
    _headerController?.close();
  }
}
