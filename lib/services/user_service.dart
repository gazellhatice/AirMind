import '../models/user.dart';
import 'database_service.dart';

class UserService {
  final DatabaseService _dbService = DatabaseService();

  Future<void> saveUser(User user) async {
    await _dbService.insert('users', user.toJson());
  }

  Future<User?> getUser(String id) async {
    final users = await _dbService.query('users');
    final userMap = users.firstWhere((user) => user['id'] == id, orElse: () => {});
    if (userMap.isEmpty) return null;
    return User.fromJson(userMap);
  }

  Future<void> deleteUser(String id) async {
    await _dbService.delete('users', id);
  }

  Future<List<User>> getAllUsers() async {
    final users = await _dbService.query('users');
    return users.map((userMap) => User.fromJson(userMap)).toList();
  }
}
