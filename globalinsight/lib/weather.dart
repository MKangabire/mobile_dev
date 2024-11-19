import 'package:flutter/material.dart';
import 'models/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  final String city;
  const WeatherScreen({super.key, required this.city});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    weatherData = await _weatherService.fetchWeather(widget.city);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather in ${widget.city}')),
      body: weatherData == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Text(
                'Temperature: ${weatherData!['main']['temp']}°C',
                style: const TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
