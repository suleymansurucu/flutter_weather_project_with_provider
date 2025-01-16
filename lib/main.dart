import 'package:flutter/material.dart';
import 'package:flutter_weather_project_with_provider/locator.dart';
import 'package:flutter_weather_project_with_provider/widgets/weather_app_widget.dart';
import 'package:flutter_weather_project_with_provider/wiewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<WeatherViewModel>(
        create: (context)=>locator<WeatherViewModel>(),
          child: WeatherApp()),
    );
  }
}


