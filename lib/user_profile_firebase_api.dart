import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profile_page/Utils.dart';

import 'model/user.dart';

class UserProfileFirebaseAPI {
  static Future<String> createUser(Users user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    user.id = docUser.id;
    await docUser.set(user.toJson());

    return docUser.id;
  }

  static Stream<List<Users>> readUsers() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .transform(Utils.transformer(Users.fromJson));
  }

  static Future updateUser(Users user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);

    await docUser.update(user.toJson());
  }

  static Future deleteUser(Users user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);

    await docUser.delete();
  }
}
