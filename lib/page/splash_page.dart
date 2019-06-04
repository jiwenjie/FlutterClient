import 'package:flutter/material.dart';
import 'package:flutter_client/bloc/bloc_provider.dart';
import 'package:flutter_client/bloc/settings_bloc.dart';
import 'package:flutter_client/configs/application.dart';
import 'package:flutter_client/configs/preferences_key.dart';
import 'package:flutter_client/configs/resource.dart';
import 'package:flutter_client/routers/routers.dart';
import 'package:flutter_client/utils/preference_utils.dart';
import 'package:rxdart/rxdart.dart';

/// 首页信息展示
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('进入了 SplashPage');

    // 判断是否选择了新的主题，默认是 0，如果选择了更新
    PreferenceUtils.instance
        .getInteger(PreferencesKey.THEME_COLOR_INDEX, 0)
        .then((index) {
      BlocProvider.of<SettingBloc>(context).switchTheme(index);
    });

    // 5s 倒计时，展示首页，倒计时结束后进入应用主页
    Observable.timer(0, Duration(milliseconds: 3000)).listen((_) {
      print('进入倒计时');
      Application.router.navigateTo(context, Routers.test_index_page, replace: true);   // PageView 实现底部菜单
//      Application.router.navigateTo(context, Routers.index_page, replace: true);      // BottomNavigationBar 实现底部菜单界面
    });

    return Scaffold(
      body: Container(
        padding: new EdgeInsets.fromLTRB(0, 0, 0, 50.0),
        alignment: Alignment.bottomCenter,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                Resource.splashLogo,
                width: 80.0,
                height: 80.0,
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
        ),
      ),
    );
  }
}
