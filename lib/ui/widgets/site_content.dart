import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:multiplatform_solutions/models/page_info.dart';
import 'package:multiplatform_solutions/ui/widgets/loading.dart';
import 'package:multiplatform_solutions/ui/widgets/web_page.dart';

GlobalKey<_SiteContentState> siteContentStateKey = GlobalKey();

class SiteContent extends StatefulWidget {
  const SiteContent({
    Key? key,
  }) : super(key: key);

  @override
  _SiteContentState createState() => _SiteContentState();
}

class _SiteContentState extends State<SiteContent> {
  bool isLoading = false;
  Future<PageInfo?>? loadPageFuture;

  @override
  Widget build(BuildContext context) {
    if (loadPageFuture == null) return Container();
    return FutureBuilder<PageInfo?>(
      future: loadPageFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WebPageInfo(
            pageInfo: snapshot.data!,
            key: UniqueKey(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const LoadingIndicator();
      },
    );
  }

  void loadClick(String url) {
    if (isLoading) return;
    setState(() {
      loadPageFuture = _loadHtmlPage(url);
    });
  }

  Future<PageInfo?> _loadHtmlPage(String url) async {
    if (!url.startsWith('https://') || !url.startsWith('http://')) {
      url = 'https://$url';
    }

    isLoading = true;
    try {
      final response = await http.get(Uri.parse(url));
      isLoading = false;

      if (response.statusCode == 200) {
        return PageInfo.fromResponse(response, url);
      } else {
        throw Exception('Failed to load page $url');
      }
    } catch (e) {
      isLoading = false;
      throw Exception('Failed to load page $url');
    }
  }
}
