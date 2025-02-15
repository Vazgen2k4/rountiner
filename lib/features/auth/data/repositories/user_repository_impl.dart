import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rountiner/features/auth/data/datasources/user/user_data_source.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';
import 'package:rountiner/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<void> createUser(UserModel user) {
    return _userDataSource.createUser(user);
  }

  @override
  Future<void> deleteUser(UserModel user) {
    return _userDataSource.deleteUser(user);
  }

  @override
  Future<List<UserModel>> getAllUsers() {
    return _userDataSource.getAllUsers();
  }

  @override
  Future<UserModel?> getUserByEmail(String email) {
    return _userDataSource.getUserByEmail(email);
  }

  @override
  Future<UserModel?> getUserById(String id) {
    return _userDataSource.getUserById(id);
  }

  @override
  Future<void> updateUser(UserModel user) {
    return _userDataSource.updateUser(user);
  }

  @override
  Future<bool> haveUserByEmail(String email) {
    return _userDataSource.getUserByEmail(email).then((value) => value != null);
  }
  
  // TODO: Вынести в дата соурс
  @override
  Future<UserModel?> getOrCreateUser(User? user) async {
    if (user == null) {
      log('User is null');
      return null;
    }

    final email = user.email;

    if (email == null) {
      log('Email is null');
      return null;
    }

    if (await haveUserByEmail(email)) {
      final userModel = await getUserByEmail(email);
      if (userModel != null) {
        return userModel;
      }
    }

    final newUser = UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL ?? '',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      goals: [],
    );

    await createUser(newUser);
    return newUser;
  }
}
