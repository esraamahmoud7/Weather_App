import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Views/home.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_state.dart';

void main() {
  runApp(const MyApp());
}
/*
* Search for how put icon in app bar
* Search for how put screen above without back*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context)=>BlocBuilder<GetWeatherCubit, WeatherState>(
           builder: (context, state) {
             MaterialColor ConditionName=getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStateName);
            return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      // theme: ThemeData(
                      //   primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStateName),
                      // ),
                      home: Home(Color:ConditionName),
                  // This trailing comma makes auto-formatting nicer for build methods.
                  );
  },
)
      )
    );
  }
}

MaterialColor getThemeColor(String? weatherStateName) {
  // if(weatherStateName == null)
  //   {
  //     return Colors.blue;
  //   }
  print("\n \n \n \n ${weatherStateName}\n \n \n \n");
   if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
     return Colors.orange;
  } else if (weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow'||weatherStateName == null) {
     return Colors.blue;
  } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
     return Colors.blueGrey;
  } else if (weatherStateName == 'Patchy rain possible' ||
      weatherStateName == 'Heavy Rain' ||
      weatherStateName == 'Showers	') {
     return Colors.blue;
  } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
     return Colors.deepPurple;
  } else {
     return Colors.blue;
  }
}



