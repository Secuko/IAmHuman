import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';

class InputElem extends StatelessWidget {
  const InputElem(this.labelText, this.textController)
      : isPassword = labelText == 'Password';
  final bool isPassword;
  final String labelText;
  final TextEditingController textController;

  TextInputType _getKeyboardType(){
    return labelText == 'E-mail' ? TextInputType.emailAddress : TextInputType.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: textController,
        style: AppTypography.font16w,
        obscureText: isPassword,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.next,
        keyboardType: _getKeyboardType(),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 0.15 ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          isCollapsed: true,
          labelText: labelText,
          labelStyle: AppTypography.font16,
          floatingLabelStyle: const TextStyle(
            color: AppColors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
