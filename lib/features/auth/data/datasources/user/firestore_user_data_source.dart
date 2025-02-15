import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rountiner/core/consts.dart';
import 'package:rountiner/features/auth/data/datasources/user/user_data_source.dart';
import 'package:rountiner/features/auth/data/models/user_model.dart';

class FirestoreUserDataSource implements UserDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) async {
    if (await getUserByEmail(user.email) != null) {
      throw Exception('User already exists');
    }

    await _firestore.collection(kUsersFirestorePath).add(user.toJson());
  }

  @override
  Future<void> deleteUser(UserModel user) async {
    if (await getUserById(user.id) == null) {
      throw Exception('User does not exist');
    }

    await _firestore.collection(kUsersFirestorePath).doc(user.id).delete();
  }

  @override
  Future<List<UserModel>> getAllUsers() {
    return _firestore.collection(kUsersFirestorePath).get().then((value) {
      return value.docs.map((e) => UserModel.fromJson(e.data())).toList();
    });
  }

  @override
  Future<UserModel?> getUserByEmail(String email) {
    return _firestore
        .collection(kUsersFirestorePath)
        .where('email', isEqualTo: email)
        .get()
        .then((u) =>
            u.docs.isNotEmpty ? UserModel.fromJson(u.docs.first.data()) : null);
  }

  @override
  Future<UserModel?> getUserById(String id) {
    return _firestore
        .collection(kUsersFirestorePath)
        .doc(id)
        .get()
        .then((u) => u.data() != null ? UserModel.fromJson(u.data()!) : null);
  }

  @override
  Future<void> updateUser(UserModel user) async {
    if (await getUserById(user.id) == null) {
      throw Exception('User does not exist');
    }

    await _firestore
        .collection(kUsersFirestorePath)
        .doc(user.id)
        .update(user.toJson());
  }
}
