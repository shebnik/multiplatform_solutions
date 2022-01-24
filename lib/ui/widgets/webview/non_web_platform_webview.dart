import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:multiplatform_solutions/services/app_platform.dart';

Widget webView(String url) => AppPlatform.isMobile
    ? WebView(
        initialUrl: url,
      )
    : HyperLink(link: url);

class HyperLink extends StatelessWidget {
  final String link;

  const HyperLink({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launch(link),
      child: Center(
        child: Text(
          link,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
