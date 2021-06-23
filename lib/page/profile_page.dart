import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_page/widget/profileview_widget.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    //final user = UserPreferences.myUser;

    return Scaffold(
        body: Column(
      children: [
        FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('users').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return UsersWidget(documents: snapshot.data!.docs);
              } else {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              }
            }),

        /*StreamBuilder<List<Users>>(
                stream: UserProfileFirebaseAPI.readUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final users = snapshot.data;
                    final provider = Provider.of<UserNotifier>(context);
                    provider.setUsers(users!);
                    return UsersWidget(documents: snapshot.data.docs)
                  } else {
                    return Center(
                      child: Text(
                        'Something went wrong',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    );
                  }
                }),
*/
        /* StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(itemBuilder: (context, index) {
                  DocumentSnapshot user = snapshot.data?.documents[index];
                  return ListTile(
                    leading: Image.network(user['photourl']),
                    title: Text(user['username']),
                    subtitle: Text(user['petname']),
                  );
                });
              },
            )
*/
      ],
    ));
  }
}

/*
    return new Center(
      child: Column(children: [
        Stack(
            alignment: Alignment(0.1, MediaQuery.of(context).size.height / 15),
            children: [
              ProfileCoverWidget(profilecover: user.profilecover),
              Positioned(
                top: MediaQuery.of(context).size.height / 6,
                right: MediaQuery.of(context).size.width / 3,
                child: buildPetName(user),
              ),
              ProfileWidget(imagePath: user.imagePath),
            ]),
        const SizedBox(height: 24),
        buildUserName(user), //to display username
        const SizedBox(height: 24),
        buildEmail(user),
        const SizedBox(height: 24), //edit button
        Center(child: buildEditButton()), // wrap button with center
      ]),
    );
  }
}

Widget buildPetName(User user) => Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            user.petname, //displaying username
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromRGBO(236, 177, 134, 1),
            ),
          ),
        ),
      ],
    );

Widget buildUserName(User user) => Column(
      children: [
        Text(
          user.username, //displaying username
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );

Widget buildEmail(User user) => Column(
      children: [
        Text(
          user.email, //displaying user email
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );

Widget buildEditButton() => ButtonWidget(
      text: "Edit Profile",
      onclicked: () {},
    );
*/


/*


return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Stack(
                children: [
                ProfileCoverWidget(profilecover: user.profilecover),
                buildPetName(user),
                ProfileWidget(imagePath: user.imagePath),
              ])
            ], */