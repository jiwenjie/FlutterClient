import 'package:flutter_client/bloc/bloc_provider.dart';
import 'package:flutter_client/configs/application.dart';
import 'package:flutter_client/model/story.dart';
import 'package:flutter_client/utils/api.dart';
import 'package:flutter_client/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

class BannerBloc extends BaseBloc {

  final _logger = Logger('BannerBloc');

  List<StoryModel> _storyList = [];   // banner 列表

  List<StoryModel> get storyList => _storyList;

  BehaviorSubject<List<StoryModel>> _bannerController = BehaviorSubject();

  /// stream，用于 StreamBuilder 的 stream 参数
  Observable<List<StoryModel>> get storyStream => Observable(_bannerController.stream);

  // 请求头部 banner 成功后更新数据
  updateBanner(List<StoryModel> storyList) {
    _storyList.clear();
    _storyList.addAll(storyList);
    _bannerController.add(_storyList);
  }

  Future<List<StoryModel>> requestBannerList() async {
    var resp = await Application.http.getRequest(NetApi.BANNER_URL, error: (msg) => _logger.log(msg, 'banner'));
    return resp == null || resp.data == null ? [] : StoryModel.fromMapList(resp.data['data']);
  }

  @override
  void dispose() {
    _bannerController?.close();
  }
}