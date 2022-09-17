import 'package:dart_frog/dart_frog.dart';

class ContentTypeHelper {
  const ContentTypeHelper._();

  static bool contentTypeAsJson(RequestContext context) {
    return context.request.headers['content-type'] == 'application/json';
  }
}
