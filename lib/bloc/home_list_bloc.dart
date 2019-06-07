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

  List<DatasBaen> _wanDataList = [];

  List<DatasBaen> get wanDataList => _wanDataList;

  BehaviorSubject<List<DatasBaen>> _Controller = BehaviorSubject();

  /// stream，用于 StreamBuilder 的 stream 参数
  Observable<List<DatasBaen>> get wanBaseModelStream => Observable(_Controller.stream);

  // 获取列表数据后更新界面
  updateListPage(int page, List<DatasBaen> beanList) {
    if (page == 1) {
      this._wanDataList.clear();
    }
    this._wanDataList.addAll(beanList);
    _Controller.add(_wanDataList);
  }

  // add page params
  Future<WanBaseModel> requestIndexList(int page) async {
//    var resp = await Application.http.getRequest('/article/list/' + String.fromCharCode(page) + '/json', error: (msg) => _logger.log(msg, 'IndexList'));
    var resp = await Application.http.getRequest(NetApi.INDEX_LIST_URL, error: (msg) => _logger.log(msg, 'IndexList'));
    return WanBaseModel.fromMap(resp.data);
  }

  @override
  void dispose() {
    _Controller?.close();
  }
}
