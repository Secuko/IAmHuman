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

  static final font20B = TextStyle(
    color: AppColors.black,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static final font16B = TextStyle(
    color: AppColors.black,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static final font16S = TextStyle(
    color: AppColors.black,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w100,
    fontSize: 16,
  );

  static final font14B = TextStyle(
    color: AppColors.blue2,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w900,
    fontSize: 14,
  );

  static final font12 = TextStyle(
    color: AppColors.white,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );

  static final errorfont16B = TextStyle(
    color: AppColors.errorRed,
    fontFamily: _roboslab,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w900,
    fontSize: 12,
  );
}