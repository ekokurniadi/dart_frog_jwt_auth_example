import 'package:postgres/postgres.dart';

class DatabaseConfig {
  DatabaseConfig();
  PostgreSQLConnection? database;

  Future<PostgreSQLConnection> getConnection() async {
    if (database == null) {
      database = PostgreSQLConnection(
        'localhost',
        5432,
        'jazza',
        username: 'postgres',
        password: 'password',
      );
      await database!.open();
    }
    return database!;
  }
}
