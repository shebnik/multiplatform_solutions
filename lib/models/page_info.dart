import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:collection/collection.dart';

class PageInfo {
  final String title;
  final String corsHeader;
  final String url;

  PageInfo({
    required this.title,
    required this.corsHeader,
    required this.url,
  });

  @override
  String toString() =>
      'PageInfo(title: $title, corsHeader: $corsHeader, url: $url)';

  factory PageInfo.fromResponse(Response response, String url) {
    var document = parse(response.body);
    return PageInfo(
      title: document
          .getElementsByTagName('title')
          .first
          .text
          .replaceAll('\n', ''),
      corsHeader: response.headers.entries
              .firstWhereOrNull(
                  (element) => element.key == 'access-control-allow-origin')
              ?.value ??
          'None',
      url: url,
    );
  }
}
