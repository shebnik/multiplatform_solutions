import 'dart:math';
import 'dart:ui' as ui;
import 'package:universal_html/html.dart';

import 'package:flutter/material.dart';

Widget webView(String url) => WebPlatformWebView(
      url: url,
      key: UniqueKey(),
    );

class WebPlatformWebView extends StatelessWidget {
  final String url;

  const WebPlatformWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory(id, (int viewId) => IFrameElement()..src = url);
    return HtmlElementView(viewType: id);
  }
}
