import 'package:flutter/material.dart';
import 'package:flutter_weather_project_with_provider/data/weather_repository.dart';
import 'package:flutter_weather_project_with_provider/locator.dart';
import 'package:flutter_weather_project_with_provider/models/weather_model.dart';

enum WeatherState {
  InitialWeatherStat,
  WeatherLoadingState,
  WeatherLoadedState,
  WeatherErrorState
}

class WeatherViewModel with ChangeNotifier {
  late WeatherState _state;
  WeatherRepository _weatherRepository = locator<WeatherRepository>();
  WeatherModel? _responseWeather;

  WeatherViewModel() {
    _responseWeather = WeatherModel();
    _state = WeatherState.InitialWeatherStat;
  }

  WeatherState get state => _state;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Future<WeatherModel?> getWeather(String city) async {
    try {
      state = WeatherState.WeatherLoadingState;

      _responseWeather = await _weatherRepository.getWeather(city);
      state = WeatherState.WeatherLoadedState;
    } catch (e) {
      state = WeatherState.WeatherErrorState;
    }
    return _responseWeather;
  }
}
