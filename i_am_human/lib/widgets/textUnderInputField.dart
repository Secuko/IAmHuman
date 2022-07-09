import 'package:i_am_human/utils/utils.dart';
import 'package:flutter/material.dart';

class TextUnderInputField extends StatelessWidget {
  String str = "";
  TextUnderInputField(String str) {
    this.str = str;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(''),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          str,
          style: AppTypography.font12,
        ),
      ),
    );
  }
}
