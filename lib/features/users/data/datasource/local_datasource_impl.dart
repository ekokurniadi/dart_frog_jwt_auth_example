import 'package:hallo/features/users/data/datasource/local_datasource.dart';
import 'package:hallo/features/users/data/models/user_model.dart';

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<List<UserModel>> getAllUsers() async {
    final u = <Map<String, dynamic>>[
      {
        'id': 1,
        'name': 'Ahmad',
        'age': 17,
        'user_name': 'ahmad@gmail.com',
        'password': '123'
      },
      {
        'id': 2,
        'name': 'Budi',
        'age': 24,
        'user_name': 'budi@gmail.com',
        'password': '123'
      },
      {
        'id': 3,
        'name': 'Chika',
        'age': 3,
        'user_name': 'chika@gmail.com',
        'password': '123'
      },
      {
        'id': 4,
        'name': 'Dedi',
        'age': 32,
        'user_name': 'dedi@gmail.com',
        'password': '123'
      },
      {
        'id': 5,
        'name': 'Eli',
        'age': 41,
        'user_name': 'eli@gmail.com',
        'password': '123'
      },
      {
        'id': 6,
        'name': 'Firman',
        'age': 46,
        'user_name': 'firman@gmail.com',
        'password': '123'
      },
    ];

    final userModel = List<UserModel>.from(u.map(UserModel.fromJson));

    return userModel;
  }
}
