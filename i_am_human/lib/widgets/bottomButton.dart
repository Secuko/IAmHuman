import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';

class BottomButton extends StatelessWidget {
  String str = "";
  BottomButton(this.str);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.black,
        gradient: const LinearGradient(
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
        child: FittedBox(
          child: Text(str, style: AppTypography.font26),
        ),
      ),
    );
  }
}
