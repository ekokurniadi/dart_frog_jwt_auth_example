import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/extensions/request_method_x.dart';
import 'package:hallo/helpers/response_helper.dart';
import 'package:hallo/jwt/jwt_service.dart';
import 'package:hallo/users/domain/usecases/get_all_users.dart';

Future<Response> onRequest(RequestContext context) async {
  final requestMethod = context.request.method;
  if (requestMethod.isGet) {
    return _getAllUsers(context);
  } else {
    return ResponseHelper.methodNotAllowed();
  }
}

Future<Response> _getAllUsers(RequestContext context) async {
  final middleWareService = context.read<JwtService>();
  final verifyToken = await middleWareService.verifyToken(context);
  final getAllUsersUsescase = GetAllUsers();

  if (!verifyToken) {
    return ResponseHelper.unAuthorized();
  } else {
    final users = await getAllUsersUsescase();
    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully get all Users',
      body: users,
    );
  }
}
