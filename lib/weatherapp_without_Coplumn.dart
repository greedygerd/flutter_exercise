import 'package:flutter/material.dart';

void main() {
WeatherData klaus = WeatherData("Berlin", 25.0, "Sonnig");


  runApp( MyApp(klaus));
}

class MyApp extends StatelessWidget{
final WeatherData weatherData;
 MyApp(this.weatherData);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Wetter-App"),
        ),
        body:  Center(child: WeatherApp(weatherData),


        ),
      ),
    );
  }
}

class WeatherApp extends StatelessWidget {
  final WeatherData weatherData;
  WeatherApp(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return Container(
       child:  Text("Willkommen zur Wetter-App! Stadt ${weatherData.city} Temperatur: ${weatherData.temperature}˜C ${weatherData.weatherCondition}",
      style: TextStyle(
        color:Colors.blue,
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
      ),
      );
  }
}

class WeatherData{
  String city;
  double temperature;
  String weatherCondition;
  
  WeatherData(this.city,this.temperature,this.weatherCondition);
}