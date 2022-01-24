import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/models/page_info.dart';

import 'webview/mock_webview.dart'
    if (dart.library.io) 'package:multiplatform_solutions/ui/widgets/webview/non_web_platform_webview.dart'
    if (dart.library.html) 'package:multiplatform_solutions/ui/widgets/webview/web_platform_webview.dart';

class WebPageInfo extends StatelessWidget {
  const WebPageInfo({
    required this.pageInfo,
    Key? key,
  }) : super(key: key);

  final PageInfo pageInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            pageInfo.title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Text(
            'CORS Header: ' + pageInfo.corsHeader,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: webView(pageInfo.url),
        ),
      ],
    );
  }
}
