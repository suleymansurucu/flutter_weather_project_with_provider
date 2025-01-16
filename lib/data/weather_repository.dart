

import 'package:flutter_weather_project_with_provider/data/weather_api_client.dart';

import '../locator.dart';
import '../models/weather_model.dart';


class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<WeatherModel> getWeather(String city) async {
   /* final int cityID = await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(cityID);*/
    print(await weatherApiClient.getWeather(cityName: city).toString());

    return await weatherApiClient.getWeather(cityName: city);

  }
}
