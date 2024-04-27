import 'package:weather/models/WeatherModel.dart';

class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherInfo;

  WeatherLoadedState({required this.weatherInfo});
}
class WeatherFailureState extends WeatherState{}
