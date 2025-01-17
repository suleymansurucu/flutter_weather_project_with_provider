import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_project_with_provider/widgets/weather_image_widget.dart';
import 'package:flutter_weather_project_with_provider/wiewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';
import 'choose_city.dart';
import 'last_updated_widget.dart';
import 'location_widget.dart';
import 'max_and_min_derece_widget.dart';

class WeatherApp extends StatelessWidget {
  String choosedCity = 'Ankara';

  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    Completer<void> _refreshIndicator=Completer<void>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
                // choosedCity = await Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCity()),
                choosedCity = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChooseCity()));
                _weatherViewModel.getWeather(choosedCity);
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: (_weatherViewModel.state == WeatherState.WeatherLoadedState)
            ? buildListViewWithWeather()
            : (_weatherViewModel.state == WeatherState.WeatherLoadingState)
                ? buildWeatherCalling()
                : (_weatherViewModel.state == WeatherState.WeatherErrorState)
                    ? buildWeatherError()
                    : Text('Please Choose City'),
      ),
    );
  }

  ListView buildListViewWithWeather() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: LocationWidget(
            choosedCity: choosedCity,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: LastUpdatedWidget()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: WeatherImageWidget()),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: MaxAndMinDereceWidget()),
        ),
      ],
    );
  }

  buildWeatherCalling() {
    return CircularProgressIndicator();
  }

  buildWeatherError() {
    return Text('Error, OPPS!');
  }
}
