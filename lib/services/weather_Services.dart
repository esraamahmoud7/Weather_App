import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/WeatherModel.dart';

class WeatherServices
{
  final Dio dio;
  String baseUrl = 'http://api.weatherapi.com/v1';
  final String APIKey='e507e95a42424266a70182301241704';


  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String CityName})async
  {
    try {
      Response response=await dio.get('$baseUrl/forecast.json?key=$APIKey&q=$CityName&days=1');
      // log('Response Data: ${response.data}');

      WeatherModel weatherModel=WeatherModel.fromJson(response.data);

      log(weatherModel.CityName);

      return weatherModel;


    }on DioException catch(e)
    {
      final String ErrorMessage=e.response?.data['error']['message']?? 'oops try later' ;
      throw Exception(ErrorMessage);
    }
    catch(e)
    {
      log (e.toString());
      throw Exception('oops try later');
    }

  }


}
