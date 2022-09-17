import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/extensions/request_method_x.dart';
import 'package:hallo/helpers/content_type_helper.dart';
import 'package:hallo/helpers/response_helper.dart';
import 'package:hallo/jwt/jwt_service.dart';

import 'package:hallo/users/domain/usecases/get_all_users.dart';

Future<Response> onRequest(RequestContext context) async {
  final middleWareService = context.read<JwtService>();
  final randomNumber = math.Random().nextInt(999);
  final requestMethod = context.request.method;
  final requestBody = jsonDecode(await context.request.body());
  final getAllUsersUsescase = GetAllUsers();
  final users = await getAllUsersUsescase();

  final loggedinUser = users.where(
    (element) =>
        element.userName == requestBody['user_name'] &&
        element.password == requestBody['password'],
  );

  final token = await middleWareService.generateToken({
    'id': loggedinUser.isEmpty ? randomNumber : loggedinUser.first.id,
  });
  if (ContentTypeHelper.contentTypeAsJson(context)) {
    if (requestMethod.isPost) {
      return loggedinUser.isEmpty
          ? ResponseHelper.abortWithStatus(
              status: HttpStatus.ok,
              message: 'User not found',
            )
          : ResponseHelper.json(
              status: HttpStatus.ok,
              message: 'Login Successfully',
              token: token,
              body: loggedinUser.first,
            );
    } else {
      return ResponseHelper.methodNotAllowed();
    }
  } else {
    return ResponseHelper.badRequest(message: 'Request is not a JSON');
  }
}
