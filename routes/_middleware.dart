import 'package:dart_frog/dart_frog.dart';
import 'package:hallo/core/jwt/jwt_service.dart';

final JwtService jwtService = JwtServiceImpl();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<JwtService>((_) => jwtService));
}
