import 'dart:convert';
import 'dart:io';

import 'package:i_am_human/network/api_clients/responce_validation.dart';
import 'package:i_am_human/network/entities/response.dart';

class ApiClient {
  final client = HttpClient();

  Future<Responce> getResponce() async {
    final json = await getData(
      'https://api.openweathermap.org/data/2.5/weather?lat=56.12&lon=40.4&appid=5b28fca3bdb1bbe7e4a9959e5c1a3b0b',
    ) as Map<String,dynamic>;
    final responce = Responce.fromJson(json);
    ResponceValidation.changeResponceFormatData(responce);
    print(responce.main.temp);
    return responce;
  }

  Future<dynamic> getData(String url) async {
    final _url = Uri.parse(url);
    final request = await client.getUrl(_url);
    final responce = await request.close();
    final jsonStrings = await responce.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }
}

//https://jsonplaceholder.typicode.com/posts
//https://api.openweathermap.org/data/3.0/onecall?lat=56.12&lon=40.4&exclude=hourly,daily&appid=ac9a61e7bad7bfd8cf4d4711eb3bfed8&units=metric
//https://api.openweathermap.org/data/2.5/weather?lat=56.12&lon=40.4&appid=5b28fca3bdb1bbe7e4a9959e5c1a3b0b
