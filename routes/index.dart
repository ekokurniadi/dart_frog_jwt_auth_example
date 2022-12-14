import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/core/helpers/response_helper.dart';

Future<Response> onRequest(RequestContext context) async {
  return ResponseHelper.json(
    status: HttpStatus.ok,
    message: 'Dart Frog Example',
    body: 'Dart Frog use JSON Web Token Authorizations',
  );
}
