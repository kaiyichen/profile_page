import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:profile_page/model/user.dart';
import 'package:profile_page/notifier/user_notifier.dart';
import 'package:profile_page/widget/profile_widget.dart';
import 'package:profile_page/widget/profilecover_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditWidget extends StatefulWidget {
  //AsyncSnapshot<List<Users>> usersData;
  //UsersWidget({required this.usersData});
  late final List<DocumentSnapshot> documents;
  final Users user;
  EditWidget({required this.documents, required this.user});

  @override
  _EditWidgetState createState() =>
      _EditWidgetState(documents: documents, user: user);
}

class _EditWidgetState extends State<EditWidget> {
  late final List<DocumentSnapshot> documents;
  final Users user;
  _EditWidgetState({required this.documents, required this.user});

  final TextEditingController _userPetnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: documents.map((doc) {
        return Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Account.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Stack(
                    // alignment: Alignment(2, 20),
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Row(children: [
                          ProfileCoverWidget(profilecover: doc['profilecover']),
                        ]),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 6,
                        right: MediaQuery.of(context).size.width / 5,
                        child: Container(
                          //right: MediaQuery.of(context).size.width / 5,
                          child: Row(children: [
                            ProfileWidget(imagePath: doc['photoUrl']),
                          ]),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 1.95,
                        right: MediaQuery.of(context).size.width / 1.65,
                        //  padding: new EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'petname',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(236, 177, 134, 1)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.85,
                    right: MediaQuery.of(context).size.width / 5,
                    child: Container(
                      width: MediaQuery.of(context).size.height / 2.75,
                      height: 60,
                      child: TextFormField(
                        controller: _userPetnameController,
                        /*       textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: doc['petname'],
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(236, 177, 134, 1)),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 248, 232, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(236, 177, 134, 1),
                                width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(236, 177, 134, 1)),
                          ),
                        ),
                      */
                      ),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width / 3.2,
                    bottom: MediaQuery.of(context).size.height / 9,
                    child: saveButton(),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ignore: deprecated_member_use
  Widget saveButton() => RaisedButton(
        child: Text('Save'),
        color: Colors.green,
        textColor: Colors.white,
        onPressed: () async {
          updateUser(_userPetnameController.text);

          Navigator.of(context).pop();
        },
      );

/*
  final databaseRef =
      FirebaseDatabase.instance.reference(); //database reference object

  void addData(String data) {
    databaseRef.push().set({'petname': data});
  }*/


  static Future updateUser(Users user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);

    await docUser.update(user.toJson());
  }

  Future saveData(context) async {
    final provider = Provider.of<UserNotifier>(
      context,
      listen: false,
    );

    final newUserData = Users(
        username: "",
        petname: _userPetnameController.text,
        id: "",
        email: "",
        photoUrl: "",
        profilecover: "");

    return provider.editUser(newUserData, user);
  }
}


/*
  _getProfileData() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    await Provider.of(context)
        .db
        .collecyion('users')
        .document(uid)
        .get()
        .then((result) {
      user.petname = result.data['petname'];
    });
  }
}

  Widget inputWidget(context, inputString) {
    return Container(
      width: MediaQuery.of(context).size.height / 2.75,
      height: 60,
      child: TextField(
        controller: _userPetnameController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: inputString,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintStyle: TextStyle(color: Color.fromRGBO(236, 177, 134, 1)),
          filled: true,
          fillColor: Color.fromRGBO(255, 248, 232, 1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide:
                BorderSide(color: Color.fromRGBO(236, 177, 134, 1), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color.fromRGBO(236, 177, 134, 1)),
          ),
        ),
      ),
    );
  }
*/
