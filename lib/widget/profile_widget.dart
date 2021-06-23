import 'dart:ui';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return Container(
      margin: EdgeInsets.all(20),
      width: 200,
      height: 200,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff000000),
        image: new DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
        border: new Border.all(
          color: Color.fromRGBO(236, 177, 134, 1),
          width: 7.0,
        ),
      ),
    );
  }
}
