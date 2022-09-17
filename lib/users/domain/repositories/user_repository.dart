import 'package:hallo/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getAllUsers();
}
