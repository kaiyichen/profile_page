import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_page/model/user.dart';
import 'package:profile_page/widget/editprofile_widget.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Users user = Users(
      id: "",
      username: "",
      petname: "",
      photoUrl: "",
      email: "",
      profilecover: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder<QuerySnapshot>(
              // future: Provider.of<Object>(context).auth.getCurretUser(),
              future: FirebaseFirestore.instance.collection('users').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // return displayUserInformation(context, snapshot);
                  return EditWidget(
                    documents: snapshot.data!.docs,
                    user: user,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
