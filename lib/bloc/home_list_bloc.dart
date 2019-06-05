import 'package:flutter_client/bloc/bloc_provider.dart';
import 'package:flutter_client/configs/application.dart';
import 'package:flutter_client/model/wanandroid.dart';
import 'package:flutter_client/utils/api.dart';
import 'package:flutter_client/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

/// main -> homePage -> indexList
/// 首页列表数据的 Bloc
class HomeListBloc extends BaseBloc {

  final _logger = Logger('HomeListBloc');

  WanBaseModel _wanBaseModel;

  WanBaseModel get wanBaseModel => _wanBaseModel;

  BehaviorSubject<WanBaseModel> _Controller = BehaviorSubject();

  /// stream，用于 StreamBuilder 的 stream 参数
  Observable<WanBaseModel> get wanBaseModelStream => Observable(_Controller.stream);

  // 请求头部 banner 成功后更新数据
  updatePage(WanBaseModel bean) {
    this._wanBaseModel = bean;
    _Controller.add(_wanBaseModel);
  }

  Future<WanBaseModel> requestIndexList() async {
    var resp = await Application.http.getRequest(NetApi.INDEX_LIST_URL, error: (msg) => _logger.log(msg, 'banner'));
    return WanBaseModel.fromMap(resp.data);
  }

  @override
  void dispose() {
    _Controller?.close();
  }
}
