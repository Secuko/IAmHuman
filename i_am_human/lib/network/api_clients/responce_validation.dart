

import 'package:i_am_human/network/entities/response.dart';

class ResponceValidation{
  static void changeResponceFormatData(Responce responce){
    responce.main.temp = ( responce.main.temp - 273.15).roundToDouble(); 
    responce.main.feelsLike =  (responce.main.feelsLike - 273.15).roundToDouble(); 
  }

  static String getCurrentWeatherStatus(Responce responce){
    if(responce.rain!=null){
      return 'rainy';
    } else if(responce.snow!=null){
      return 'snowy';
    } else if(responce.clouds.all>75){
      return 'sunny';
    } else if(responce.clouds.all>50){
      return 'low_cloudy';
    } else {
      return 'cloudy';
    }
  }

  static String tempToString(Responce responce){
    var str =''; 
    if (responce.main.temp>0){
      str+='+';
    } else {
      str+='-';
    } 
    return str + responce.main.temp.toString();
  }
}
