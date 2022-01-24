import 'package:flutter/material.dart';

import 'package:multiplatform_solutions/models/page_info.dart';

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
        Text(
          pageInfo.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'CORS Header: ' + pageInfo.corsHeader,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(pageInfo.htmlCode),
      ],
    );
  }
}
