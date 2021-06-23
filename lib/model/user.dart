//import 'dart:convert';

class Users {
  String id;
  String username;
  String petname;
  String photoUrl;
  String email;
  String profilecover;

  Users(
      {required this.id,
      required this.username,
      required this.petname,
      required this.photoUrl,
      required this.email,
      required this.profilecover});

  static Users fromJson(Map<String, dynamic> data) => Users(
      id: data['id'],
      username: data['username'],
      petname: data['petname'],
      photoUrl: data['photoUrl'],
      email: data['email'],
      profilecover: data['profilecover']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'petname': petname,
        'photoUrl': photoUrl,
        'email': email,
        'profilecover':profilecover,
      };
}












/*
class CurrentUser {
  final String id;
  final String name;
  final String photoUrl;
  
  CurrentUser({
    required this.id,
    required this.name,
    required this.photoUrl,
  });

  CurrentUser copyWith({
    required String id,
    required String name,
    required String profileUrl,
  }) {
    return CurrentUser(
      id: id,
      name: name,
      photoUrl: profileUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profileUrl': photoUrl,
    };
  }

  factory CurrentUser.fromDoc(DocumentSnapshot doc) {
    //if (doc == null) return null;

    return CurrentUser(
      id: doc.id,
      name: doc.get('name'),
      photoUrl: doc.get('photo_url'),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentUser.fromJson(String source) =>
      CurrentUser.fromDoc(json.decode(source));

  @override
  String toString() => 'User(id: $id, name: $name, profileUrl: $photoUrl)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CurrentUser &&
        o.id == id &&
        o.name == name &&
        o.photoUrl == photoUrl;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photoUrl.hashCode;
}


*/

/*

class User {
  final String imagePath;
  final String profilecover;
  final String petname;
  final String username;
  final String email;

  const User({
    required this.imagePath,
    required this.profilecover,
    required this.petname,
    required this.username,
    required this.email,
  });
}

*/