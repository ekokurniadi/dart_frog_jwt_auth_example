
import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/features/users/presentations/user_response.dart';

Future<Response> onRequest(RequestContext context) async {
  final response = await UserResponse.get(context);
  return response;
}
