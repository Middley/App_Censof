import 'package:app_censo/components/input_container.dart';
import 'package:app_censo/constants.dart';
import 'package:flutter/material.dart';

class RoundedPassswordInput extends StatelessWidget {
  const RoundedPassswordInput({Key key, @required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
