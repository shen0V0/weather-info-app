import 'package:flutter/material.dart';
import 'dart:math'; 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: Weather(),
    );
  }
}

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final TextEditingController _cityController = TextEditingController();

  String cityName = 'City Name';
  String temperature = 'Temperature';
  String weatherCondition = 'Weather Condition';
  List<Map<String, String>> forecast = [];

  // Function to simulate fetching weather data
  void fetchWeather() {
    setState(() {
      cityName = _cityController.text;

      // Generate a random temperature between 15°C and 30°C
      int temp = Random().nextInt(16) + 15;
      temperature = '$temp°C';

      // Randomly select a weather condition
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      weatherCondition = conditions[Random().nextInt(conditions.length)];
    });
  }

  void fetchForecast() {
    setState(() {
      forecast.clear(); 
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];

      for (int i = 0; i < 7; i++) {
        int temp = Random().nextInt(16) + 15;
        String condition = conditions[Random().nextInt(conditions.length)];
        forecast.add({
          'day': 'Day ${i + 1}',
          'temperature': '$temp°C',
          'condition': condition,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter City Name'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'City Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: fetchWeather, // Call fetchWeather when button is pressed
                  child: Text('Fetch Weather'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: fetchForecast, // Call fetchForecast when button is pressed
                  child: Text('Fetch 7-Day Forecast'),
                ),
                SizedBox(height: 40),
                // Placeholder weather data
                Text(
                  'City: $cityName',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Temperature: $temperature',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Condition: $weatherCondition',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                // Display 7-day forecast
                if (forecast.isNotEmpty) ...[
                  Text(
                    '7-Day Forecast',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  for (var day in forecast)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        '${day['day']}: ${day['temperature']}, ${day['condition']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
