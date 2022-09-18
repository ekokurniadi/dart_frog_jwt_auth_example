import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/core/helpers/response_helper.dart';
import 'package:hallo/core/jwt/jwt_service.dart';
import 'package:hallo/features/users/domain/usecases/get_all_users.dart';

class UserRequest {
  const UserRequest._();

  static Future<Response> methodGET(RequestContext context) async {
    return _getAllUsers(context);
  }

  static Future<Response> _getAllUsers(RequestContext context) async {
    final middleWare= context.read<JwtService>();
    final verifyToken = await middleWare.verifyToken(context);
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
