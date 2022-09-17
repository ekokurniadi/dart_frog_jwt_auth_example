import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

class ResponseHelper {
  const ResponseHelper._();

  static Future<Response> response({
    required int status,
    required String message,
    required dynamic body,
    String? token,
  }) async {
    if (token != null) {
      return Response.json(
        statusCode: status,
        body: {
          'message': message,
          'token': token,
          'data': body,
        },
      );
    } else {
      return Response.json(
        statusCode: status,
        body: {
          'message': message,
          'data': body,
        },
      );
    }
  }

  static Future<Response> methodNotAllowed() async {
    return ResponseHelper.response(
      status: HttpStatus.methodNotAllowed,
      message: 'Method Not Allowed',
      body: null,
    );
  }

  static Future<Response> unAuthorized() async {
    return ResponseHelper.response(
      status: HttpStatus.unauthorized,
      message: 'UnAuthorized',
      body: null,
    );
  }

  static Future<Response> badRequest({required String message}) async {
    return ResponseHelper.response(
      status: HttpStatus.badRequest,
      message: message,
      body: null,
    );
  }
}
