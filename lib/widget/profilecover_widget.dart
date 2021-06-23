//import 'dart:ui';
import 'package:flutter/material.dart';

class ProfileCoverWidget extends StatelessWidget {
  final String profilecover;

  const ProfileCoverWidget({
    Key? key,
    required this.profilecover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      //making image center
      child: buildProfileCover(context),
    );
  }

  Widget buildProfileCover(context) {
    final image = NetworkImage(profilecover);

    return Container(
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
          image: new DecorationImage(image: image, fit: BoxFit.cover)),
    );
  }
}
