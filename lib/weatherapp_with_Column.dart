import 'package:flutter/material.dart';

void main() {
  WeatherData klaus = WeatherData("Berlin", 25.0, "Sonnig");

  runApp(MyApp(klaus));
}

class MyApp extends StatelessWidget {
  final WeatherData weatherData;
  MyApp(this.weatherData);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text("Wetter-App"),
        ),
        body: Center(
          child: WeatherApp(weatherData),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: const Text(
              "Willkommen zur Wetter-App!",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
          ),
          Text(
            "In ${weatherData.city} ist es ${weatherData.temperature}˜Celsius und ${weatherData.weatherCondition}.",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class WeatherData {
  String city;
  double temperature;
  String weatherCondition;

  WeatherData(this.city, this.temperature, this.weatherCondition);
}
