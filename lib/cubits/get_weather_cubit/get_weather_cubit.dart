import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_state.dart';
import '../../models/WeatherModel.dart';
import '../../services/weather_Services.dart';

class GetWeatherCubit extends Cubit<WeatherState>
{
  GetWeatherCubit(): super(WeatherInitialState());

   WeatherModel? weatherModel;

  void FetchWeather({required String CityName})async
  {
    try
    {
      weatherModel=await WeatherServices(Dio()).getCurrentWeather(CityName: CityName);
      emit(WeatherLoadedState(weatherInfo: weatherModel!));
    }catch(e)
    {
      emit(WeatherFailureState());

    }
  }
}