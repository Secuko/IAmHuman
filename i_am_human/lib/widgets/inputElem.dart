import 'dart:html';
import 'package:i_am_human/utils/utils.dart';
import 'package:flutter/material.dart';

class InputElem extends StatefulWidget {
  //const InputElem({Key? key}) : super(key: key);

  String labelText = "";
  //bool isPassword = (labelText == "Password");

  InputElem(String labelText) {
    this.labelText = labelText;
  }

  @override
  State<StatefulWidget> createState() {
    return InputElemState(labelText);
  }
}

class InputElemState extends State<InputElem> {
  bool isPassword = false;
  String labelText = "";
  InputElemState(String labelText) {
    this.isPassword = (labelText == "Password");
    this.labelText = labelText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        child: TextField(
          maxLines: 1,
          obscureText: isPassword,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: AppTypography.font20,
        ));
  }
}
