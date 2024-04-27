import 'package:flutter/material.dart';

import '../models/WeatherModel.dart';


class WeatherBody extends StatelessWidget {
   WeatherBody({super.key,required this.weatherModel,required this.color});

  final WeatherModel weatherModel;
  final Color color;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          begin:Alignment.topCenter ,
          end:Alignment.bottomCenter  ,
          colors: [color,Colors.white]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(weatherModel.CityName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("Updated at : ${weatherModel.date.hour}:${weatherModel.date.minute}",style: TextStyle(fontSize: 20)),
                  SizedBox(height: 32,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network("https:${weatherModel.Image}"),
                      Text(weatherModel.temp.round().toString(),style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold)),
                      Column(
                        children: [
                          Text("MaxTemp : ${weatherModel.maxTemp.round()}",style: TextStyle(fontSize: 16)),
                          Text("MinTemp : ${weatherModel.minTemp.round()}",style: TextStyle(fontSize: 16))
                        ],
                      )
                      ]
                  ),
                  SizedBox(height: 32,),
                  Text(weatherModel.weatherStateName,style: TextStyle(fontSize: 32)),
        ]
          ),
      ),
    );
  }
}

DateTime StringToDateTime(String value)
{
  return DateTime.parse(value);
}