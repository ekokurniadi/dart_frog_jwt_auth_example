import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/core/extensions/request_method_x.dart';
import 'package:hallo/core/helpers/response_helper.dart';
import 'package:hallo/features/users/presentations/users_request.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.HttpMethodGet) {
    final response = await UserRequest.methodGET(context);
    return response;
  }
  return ResponseHelper.methodNotAllowed();
}
