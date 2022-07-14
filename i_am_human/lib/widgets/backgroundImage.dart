import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';

class BackgroundImage extends StatelessWidget {
  final _hours = (DateTime.now()).hour;
    //int _hours = 2;
    //String imageName = getBackgroundImage();
    
  String getBackgroundImage(){
    String imageName = '';
    if ((_hours >= 3) && (_hours < 9)) {
      imageName = "backgroundMorning";
    } else if ((_hours >= 9) && (_hours < 15)) {
      imageName = "backgroundDay";
    } else if ((_hours >= 15) && (_hours < 21)) {
      imageName = "backgroundEvening";
    } else {
      imageName = "backgroundNight";
    }
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //color: AppColors.blue,
      child: Image(
        image: AssetImage('assets/background/' + getBackgroundImage() + '.jpg'),
        fit: (MediaQuery.of(context).size.width<MediaQuery.of(context).size.height) ? BoxFit.cover: BoxFit.contain,
      ),
    );
  }
}