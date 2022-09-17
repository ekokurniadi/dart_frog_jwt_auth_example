import 'package:dart_frog/dart_frog.dart';

extension RequestMethodX on HttpMethod {
  bool get isGet => this == HttpMethod.get;
  bool get isPost => this == HttpMethod.post;
  bool get isPut => this == HttpMethod.put;
  bool get isDelete => this == HttpMethod.delete;
  bool get isOptions => this == HttpMethod.options;
}
