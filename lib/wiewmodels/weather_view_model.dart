import 'package:flutter/material.dart';
import 'package:flutter_weather_project_with_provider/data/weather_repository.dart';
import 'package:flutter_weather_project_with_provider/locator.dart';
import 'package:flutter_weather_project_with_provider/models/weather_model.dart';

/// Enum to define different weather states
enum WeatherState {
  InitialWeatherState,  // Initial state when no data is loaded
  WeatherLoadingState,  // State when fetching weather data
  WeatherLoadedState,   // State when data is successfully loaded
  WeatherErrorState     // State when an error occurs
}

class WeatherViewModel with ChangeNotifier {
  WeatherState _state;
  final WeatherRepository _weatherRepository = locator<WeatherRepository>();
  late WeatherModel _responseWeather;

  /// Constructor: Initializes state and empty weather data
  WeatherViewModel() {
    _responseWeather = WeatherModel();
    _state = WeatherState.InitialWeatherState;
  }

  /// Getter for current state
  WeatherState get state => _state;

  /// Getter for fetched weather data
  WeatherModel? get responseWeather => _responseWeather;

  /// Setter for state, ensures UI updates when state changes
  set state(WeatherState value) {
    _state = value;
    notifyListeners();  // Notifies UI to rebuild when state changes
  }

  /// Fetch weather data for a given city
  Future<WeatherModel?> getWeather(String city) async {
    try {
      state = WeatherState.WeatherLoadingState;

      _responseWeather = await _weatherRepository.getWeather(city);

      if (_responseWeather != null) {
        state = WeatherState.WeatherLoadedState;
      } else {
        state = WeatherState.WeatherErrorState;
      }
    } catch (e) {
      state = WeatherState.WeatherErrorState;
      debugPrint("Error fetching weather data: $e");
    }
    return _responseWeather;
  }
}
