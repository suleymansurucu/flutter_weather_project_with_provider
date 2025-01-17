import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wiewmodels/weather_view_model.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var iconURL = _weatherViewModel.responseWeather?.current?.condition?.icon;
    String newIconURL = 'https:${iconURL}';
    return Column(
        children: [
    Text('${_weatherViewModel.responseWeather?.current!.tempC.toString()}C' ?? '', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    Image.network(newIconURL, width: 150,height: 150, fit: BoxFit.fitWidth,
    ),
    ]
    ,
    );


  }
}
