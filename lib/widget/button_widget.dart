import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onclicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onclicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(), //rounded button
      onPrimary: Colors.deepOrange[300],  //Text button colour
      padding: EdgeInsets.symmetric(horizontal:  32, vertical: 12), //padding
    ),
        child: Text(text),
        onPressed: onclicked,
      );
}
