
import 'dart:developer';

class WeatherModel {
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;
  final String CityName;
  final String Image;


  WeatherModel(
      {required this.date,
        required this.temp,
        required this.maxTemp,
        required this.minTemp,
        required this.weatherStateName,
        required this.CityName,
        required this.Image});

      factory WeatherModel.fromJson(json) {

        return WeatherModel(
            date:  DateTime.parse(json['current']['last_updated']),
            temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
            maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
            minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
            weatherStateName: json['forecast']['forecastday'][0]['day']['condition']['text'],
            CityName: json['location']['name'],
            Image:json['forecast']['forecastday'][0]['day']['condition']['icon']

        );
      }


}