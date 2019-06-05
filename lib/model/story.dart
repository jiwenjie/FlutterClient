class StoryModel {
  String title;
  String image;
  int id;
  String url;

  static StoryModel fromMap(Map<String, dynamic> json){
    StoryModel story = new StoryModel();
    story.id = json['id'];
    story.title = json['title'];
    story.url = json['url'];
    story.image = json['imagePath'];
    return story;
  }

  // 获取网络请求，从请求中拿出列表数据
  static List<StoryModel> fromMapList(dynamic mapList) {
    List<StoryModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
