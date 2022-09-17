import 'package:hallo/users/data/datasource/local_datasource.dart';
import 'package:hallo/users/data/datasource/local_datasource_impl.dart';
import 'package:hallo/users/data/models/user_model.dart';
import 'package:hallo/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final LocalDataSource localDataSource = LocalDataSourceImpl();

  @override
  Future<List<UserModel>> getAllUsers() async {
    final users = await localDataSource.getAllUsers();
    return users;
  }
}
