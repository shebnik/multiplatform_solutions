import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:collection/collection.dart';

class PageInfo {
  final String title;
  final String corsHeader;
  final String htmlCode;

  PageInfo({
    required this.title,
    required this.corsHeader,
    required this.htmlCode,
  });

  @override
  String toString() =>
      'PageInfo(title: $title, corsHeader: $corsHeader, htmlCode: $htmlCode)';

  factory PageInfo.fromResponse(Response response) {
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
      htmlCode: response.body,
    );
  }
}
