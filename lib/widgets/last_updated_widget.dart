import 'package:flutter/material.dart';
import 'package:flutter_weather_project_with_provider/wiewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';

class LastUpdatedWidget extends StatelessWidget {


   LastUpdatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var newDate = _weatherViewModel.responseWeather?.location?.localtime.toString();
    return Text('Last Updated : ' + newDate!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),);
  }
}
