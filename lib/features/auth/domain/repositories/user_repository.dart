
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel?> getUserById(String id);
  Future<UserModel?> getUserByEmail(String email);
  Future<bool> haveUserByEmail(String email);
  
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser(UserModel user);
  
  Future<List<UserModel>> getAllUsers();
  
  Future<UserModel?> getOrCreateUser(User? user);
}