import 'dart:convert';
import 'dart:io';
import 'package:i_am_human/network/entities/response.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Responce>> geResponces() async {
    final json = await getResponce(
      'https://api.openweathermap.org/data/2.5/weather?lat=56.12&lon=40.4&appid=5b28fca3bdb1bbe7e4a9959e5c1a3b0b',
    ) as List<dynamic>;
    final responce = json.map((dynamic e) => Responce.fromJson(e as Map<String,dynamic>)).toList();
    return responce;
  }

  Future<dynamic> getResponce(String url) async {
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
