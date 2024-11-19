import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = 'f41a5ec02f5d8675038fd3316e998f93';

  Future<Map<String, dynamic>?> fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to load weather data');
      return null;
    }
  }
}

// Future<List<Map<String, dynamic>>> fetchWeatherForCities(
//     List<String> cities) async {
//   List<Map<String, dynamic>> weatherList = [];
//   for (var city in cities) {
//     final data = await fetchWeather(city);
//     if (data != null) {
//       weatherList.add(data);
//     }
//   }
//   return weatherList;
// }

