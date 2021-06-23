import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:profile_page/page/profile_edit.dart';
import 'package:profile_page/widget/profile_widget.dart';
import 'package:profile_page/widget/profilecover_widget.dart';
import 'package:flutter/material.dart';

class UsersWidget extends StatelessWidget {
  //AsyncSnapshot<List<Users>> usersData;
  //UsersWidget({required this.usersData});
  final List<DocumentSnapshot> documents;
  UsersWidget({required this.documents});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<UserNotifier>(context);
    // final users = provider.userList;

    final databaseReference = FirebaseDatabase.instance.reference();

    return /*users.isEmpty
        ? Center(
            child: Text(
              'NO USER',
              style: TextStyle(fontSize: 20),
            ),
          )
        :*/
        Column(
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
                      Container(
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
                    ],
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 2.3,
                    right: MediaQuery.of(context).size.width / 2.8,
                    child: buildPetName(doc['petname']),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 2.9,
                    right: MediaQuery.of(context).size.width / 1.45,
                    child: Text('Username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(236, 177, 134, 1),
                        )),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width / 10,
                    bottom: MediaQuery.of(context).size.height / 3.1,
                    child: buildUserName(doc['username']),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 4.4,
                    right: MediaQuery.of(context).size.width / 1.3,
                    child: Text('Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(236, 177, 134, 1),
                        )),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width / 10,
                    bottom: MediaQuery.of(context).size.height / 4.8,
                    child: buildEmail(doc['email']),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width / 3.2,
                    bottom: MediaQuery.of(context).size.height / 9,
                    child: buildEditButton(context),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

Widget buildPetName(String petname) => Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            petname, //displaying username
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromRGBO(236, 177, 134, 1),
            ),
          ),
        ),
      ],
    );

Widget buildUserName(String username) => Container(
    width: 200,
    height: 50,
    child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(236, 177, 134, 1),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                username,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ))));

Widget buildEmail(String email) => Container(
    width: 200,
    height: 50,
    child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(236, 177, 134, 1),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                email,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ))));

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: Colors.orange,
  minimumSize: Size(100, 50),
  padding: EdgeInsets.all(2),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);

Widget buildEditButton(context) => RawMaterialButton(
      fillColor: Color.fromRGBO(255, 248, 232, 1),
      splashColor: Colors.orangeAccent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Edit Profile',
            style: TextStyle(color: Color.fromRGBO(236, 177, 134, 1)),
          )
        ],
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfile()));
      },
      /*  ); 
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => EditProfile()));
      }, */
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 3, color: Color.fromRGBO(236, 177, 134, 1))),
    );
