import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/core/extensions/request_method_x.dart';
import 'package:hallo/core/helpers/response_helper.dart';
import 'package:hallo/core/jwt/jwt_service.dart';
import 'package:hallo/features/users/domain/usecases/get_all_users.dart';

class UserResponse {
  const UserResponse._();

  static Future<Response> get(RequestContext context) async {
    final requestMethod = context.request.method;
    if (requestMethod.isGet) {
      return _getAllUsers(context);
    } else {
      return ResponseHelper.methodNotAllowed();
    }
  }

  static Future<Response> _getAllUsers(RequestContext context) async {
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
}
