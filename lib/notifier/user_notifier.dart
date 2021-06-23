import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:profile_page/model/user.dart';
import 'package:profile_page/user_profile_firebase_api.dart';

class UserNotifier with ChangeNotifier {
  List<Users> _userList = [];
  late Users _currentUser;

  UnmodifiableListView<Users> get userlist => UnmodifiableListView(_userList);

  Users get currentuser => _currentUser;

  set userList(List<Users> userlist) {
    _userList = userlist;
    notifyListeners();
  }

  set currentUser(Users user) {
    _currentUser = user;
    notifyListeners();
  }

  void setUsers(List<Users> userList) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _userList = userList;
        notifyListeners();
      });

  List<Users> get userList => _userList;

  void editUser(Users newData, Users oldData) {
    final index = _userList.indexWhere((element) => element.id == oldData.id);
    _userList[index] = newData;
    UserProfileFirebaseAPI.updateUser(newData);

    notifyListeners();
  }
}
