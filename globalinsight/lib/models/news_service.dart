import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  final String apiKey = '9415f71e101b47f78a0721b1d1645c37';

  Future<List<dynamic>?> fetchNews(String category) async {
    final url =
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['articles'];
    } else {
      print('Failed to load news data');
      return null;
    }
  }
}
