import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';


class InputElem extends StatelessWidget {
  bool isPassword = false;
  String labelText = '';
  TextEditingController? _textController;
  InputElem(String labelText, TextEditingController control) {
    this.isPassword = labelText == 'Password';
    this.labelText = labelText;
    _textController=control;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        child: TextField(
          controller: _textController,
          maxLines: 1,
          obscureText: isPassword,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            isCollapsed: true,
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: AppTypography.font20,
        ));
  }
}
