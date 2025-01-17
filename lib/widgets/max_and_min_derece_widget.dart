import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wiewmodels/weather_view_model.dart';

class MaxAndMinDereceWidget extends StatelessWidget {
  const MaxAndMinDereceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    String? weatherText = _weatherViewModel.responseWeather!.current?.condition?.text.toString();
    var weatherFeelsLike=_weatherViewModel.responseWeather!.current?.feelslikeC;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Today is: $weatherText', style: TextStyle(fontSize: 20)),
        Text('Feels like: ${weatherFeelsLike}C',style: TextStyle(fontSize: 20),),
      ],
    );
  }
}
