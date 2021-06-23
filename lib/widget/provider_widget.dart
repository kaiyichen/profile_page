import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Provider extends InheritedWidget {
  final AuthService auth;
  final db;

  Provider(
      {required Key key, required Widget child, required this.auth, this.db})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
}
