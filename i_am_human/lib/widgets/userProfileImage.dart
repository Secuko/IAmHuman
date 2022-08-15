import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
class UserProfileImage extends StatelessWidget {
  const UserProfileImage({Key? key}) : super(key: key);
  double _getImageFrameParametr(double width) {
    if (width < 300) {
      return width - 30;
    } else {
      return 270;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => print('Add Image'),
      child: Center(
        child: Container(
          height: _getImageFrameParametr(
            screenWidth * 3 / 7,
          ),
          width: _getImageFrameParametr(
            screenWidth * 3 / 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              _getImageFrameParametr(
                screenWidth * 4 / 14,
              ),
            ),
            color: AppColors.whiteLight,
          ),
          child: const SizedBox(
            height: 100,
            width: 100,
            child: Image(
              image: AssetImage('assets/icon/addIcon.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}