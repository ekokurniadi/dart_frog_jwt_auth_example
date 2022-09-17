import 'package:hallo/users/data/models/user_model.dart';
import 'package:hallo/users/data/repositories/user_repository_impl.dart';
import 'package:hallo/users/domain/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository userRepository = UserRepositoryImpl();

  Future<List<UserModel>> call() async {
    final users = await userRepository.getAllUsers();
    return users;
  }
}
