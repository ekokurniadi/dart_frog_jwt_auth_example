
import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/features/login/presentations/login_response.dart';

Future<Response> onRequest(RequestContext context) async {
  final response = await LoginResponse.post(context);
  return response;
}
