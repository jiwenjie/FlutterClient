import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {

  String title;
  String url;

  WebViewPage({Key key, @required this.title, @required this.url}) : super(key: key);

  @override
  State createState() {
    return new WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {

  bool isLoad = true;
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((state) {
      debugPrint("state:_" + state.type.toString());
      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoad = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoad = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: WebviewScaffold(
            url: widget.url,
        appBar: AppBar(
          elevation: 0.4,
          title: Text(widget.title),
          bottom: PreferredSize(
              child: isLoad ? LinearProgressIndicator() :  Divider(height: 1.0, color: Colors.red), // color 颜色暂时写死
              preferredSize: const Size.fromHeight(1.0)),
        ),
          withJavascript: true,
          withZoom: false,
          withLocalStorage: true,
        ),
      onWillPop: () {},);
  }
}




























