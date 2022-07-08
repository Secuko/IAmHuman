import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';

class AppTypography {
  const AppTypography._();

  static const String _roboslab = 'Roboslab';

  static const _color = AppColors.black;

  static final font9 = TextStyle(
    color: _color,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 26,
  );

  static final font26 = TextStyle(
    color: AppColors.white,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 26,
  );

  static final font20 = TextStyle(
    color: AppColors.white,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );
}