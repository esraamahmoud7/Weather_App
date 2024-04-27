import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather/widgets/NoWeatherBody.dart';
import 'package:weather/widgets/infoWeatherBody.dart';

import 'Search.dart';


class Home extends StatefulWidget {
  const Home({super.key, required this.Color});

  final MaterialColor Color;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.Color,
          title: Title(
            color: Colors.black,
            child: const Text("Weather App"),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context){return Search();})
                  );
                  }
                , icon: Icon(Icons.search))],
        ),
        body: BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (context,state)
          {
            if(state is WeatherInitialState)
              {
                return NoWeatherBody();
              }
            else if (state is WeatherLoadedState)
            {
              return WeatherBody(weatherModel: state.weatherInfo,color:widget.Color);
            }
            else
              {
                return Text("Opps there was an error :) ");
              }


          },
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}