import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryService {
  Future<List<dynamic>?> fetchCountries() async {
    const url = 'https://restcountries.com/v3.1/all';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to load countries data');
      return null;
    }
  }
}
