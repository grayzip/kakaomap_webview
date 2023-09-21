import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@deprecated
class KakaoMapScreen extends StatelessWidget {
  KakaoMapScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
          body: SafeArea(
        child: WebViewWidget(controller: controller),
      )),
    );
  }

  // JavascriptChannel _toasterJavascriptChannel() {
  //   return JavascriptChannel(
  //       name: 'Toaster',
  //       onMessageReceived: (JavascriptMessage message) {
  //         _scaffoldMessengerKey.currentState
  //             ?.showSnackBar(SnackBar(content: Text(message.message)));
  //       });
  // }
}
