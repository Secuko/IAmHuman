import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';

class TextUnderInputField extends StatelessWidget {
  String str = '';
  TextUnderInputField(String str) {
    this.str = str;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left:5, top: 1, bottom: 1, right:5),
        child: Text(
          str,
          style: AppTypography.font12,
        ),
      );
  }
}
