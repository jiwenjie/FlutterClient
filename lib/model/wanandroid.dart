class WanBaseModel {
  WanDataBean bean;
  int errorCode;
  String errorMsg;

  static WanBaseModel fromMap(Map<String, dynamic> map) {
    WanBaseModel model = new WanBaseModel();
    model.errorCode = map['errorCode'];
    model.errorMsg = map['errorMsg'];
//    print(map['data']);
    model.bean = WanDataBean.fromMapList(map['data']);
    return model;
  }
}

class WanDataBean {
  int curPage;
  List<DatasBaen> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  static WanDataBean fromMapList(Map<String, dynamic> map) {
    WanDataBean bean = new WanDataBean();
    bean.curPage = map['curPage'];
    bean.offset = map['offset'];
    bean.over = map['over'];
    bean.pageCount = map['pageCount'];
    bean.size = map['size'];
    bean.total = map['total'];
    bean.datas = DatasBaen.fromListMap(map['datas']);
    return bean;
  }
}

class DatasBaen {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime; // 应该使用长整型
  int superChapterId;
  String superChapterName;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  static DatasBaen fromMap(Map<String, dynamic> map) {
    DatasBaen bean = new DatasBaen();
    bean.apkLink = map['apkLink'];
    bean.author = map['author'];
    bean.chapterId = map['chapterId'];
    bean.chapterName = map['chapterName'];
    bean.collect = map['collect'];
    bean.courseId = map['courseId'];
    bean.desc = map['desc'];
    bean.envelopePic = map['envelopePic'];
    bean.fresh = map['fresh'];
    bean.id = map['id'];
    bean.link = map['link'];
    bean.niceDate = map['niceDate'];
    bean.origin = map['origin'];
    bean.prefix = map['prefix'];
    bean.projectLink = map['projectLink'];
    bean.publishTime = map['publishTime'];
    bean.superChapterId = map['superChapterId'];
    bean.superChapterName = map['superChapterName'];
    bean.title = map['title'];
    bean.type = map['type'];
    bean.userId = map['userId'];
    bean.visible = map['visible'];
    bean.zan = map['zan'];
    return bean;
  }

  static List<DatasBaen> fromListMap(dynamic mapList) {
    List<DatasBaen> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}