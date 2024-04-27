import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/WeatherModel.dart';
import 'package:weather/services/weather_Services.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class Search extends StatelessWidget {
  const Search({super.key});

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
              var weatherCubit=BlocProvider.of<GetWeatherCubit>(context);
              weatherCubit.FetchWeather(CityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)
              ),

            ),
          ),
        ),
      ),
    );
  }

}

WeatherModel? weatherModel;