import 'dart:math';
import 'package:flutter/material.dart';
//final
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather info app',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _cityController = TextEditingController();

  String cityName = 'City Name';
  String temperature = 'Temperature';
  String weatherCondition = 'Weather Condition';
void fetchWeather() {
    setState(() {
      cityName = _cityController.text;

      int temp = Random().nextInt(16) + 15;
      temperature = '$temp°C';

      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      weatherCondition = conditions[Random().nextInt(conditions.length)];
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Weather app'),
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
                  onPressed: fetchWeather, 
                  child: Text('Fetch Weather'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}