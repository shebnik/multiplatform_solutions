import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/services/app_platform.dart';
import 'package:multiplatform_solutions/ui/widgets/footer_widget.dart';
import 'package:multiplatform_solutions/ui/widgets/site_content.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (AppPlatform.platform == CustomPlatform.android) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SiteContent(key: siteContentStateKey)),
            FooterWidget(
              loadClick: (url) =>
                  siteContentStateKey.currentState?.loadClick(url),
            ),
          ],
        ),
      ),
    );
  }
}
