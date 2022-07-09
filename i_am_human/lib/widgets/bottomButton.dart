import 'package:i_am_human/utils/utils.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  String str = "";
  BottomButton(String str) {
    this.str = str;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(''),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.black,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.black45,
              Colors.white24,
            ],
          ),
        ),
        width: 192,
        height: 45,
        child: Center(
          child: Text(str, style: AppTypography.font26),
        ),
      ),
    );
  }
}
