import 'package:i_am_human/utils/utils.dart';
import 'package:flutter/material.dart';

class TextUnderInputField extends StatelessWidget {
  String str = "";
  TextUnderInputField(String str) {
    this.str = str;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left:5, top: 3, bottom: 3, right:5),
        //margin: EdgeInsets.symmetric(vertical: 3.0),
        child: Text(
          str,
          style: AppTypography.font12,
        ),
      );
  }
}


/*return GestureDetector(
      onTap: () => print(''),
      child: Container(
        color: Colors.blue,
        //height: 60,
        padding: EdgeInsets.all(5),
        //margin: EdgeInsets.symmetric(vertical: 3.0),
        child: Text(
          str,
          style: AppTypography.font12,
        ),
      ),
    );*/