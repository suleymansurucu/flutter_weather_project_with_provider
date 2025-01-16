import 'package:flutter_weather_project_with_provider/data/weather_api_client.dart';
import 'package:flutter_weather_project_with_provider/data/weather_repository.dart';
import 'package:flutter_weather_project_with_provider/wiewmodels/weather_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


GetIt locator=GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => http.Client());

  locator.registerLazySingleton(()=> WeatherRepository());
  locator.registerLazySingleton(()=> WeatherApiClient(httpClient: locator<http.Client>()));

  locator.registerFactory(()=>WeatherViewModel());

}