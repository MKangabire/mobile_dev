import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news_service.dart';
import 'package:intl/intl.dart';
import 'newsdetails.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService _newsService = NewsService();
  List<dynamic>? newsArticles;

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  void fetchNewsData() async {
    newsArticles = await _newsService.fetchNews('technology');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 138, 76),
      appBar: AppBar(
        title: const Text('Latest News'),
        backgroundColor: const Color.fromARGB(255, 219, 171, 99),
      ),
      body: newsArticles == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: newsArticles!.length,
                itemBuilder: (context, index) {
                  final article = newsArticles![index];
                  final imageUrl = article['urlToImage'] ?? '';
                  final title = article['title'] ?? 'No Title';
                  final description =
                      article['description'] ?? 'No Description';
                  final content = article['content'] ?? 'No Content Available';
                  final source = article['source']['name'] ?? 'Unknown Source';
                  final publishedAt = article['publishedAt'] ?? '';
                  final formattedDate = publishedAt.isNotEmpty
                      ? DateFormat.yMMMMd().format(DateTime.parse(publishedAt))
                      : 'Unknown Date';
                  final url = article['url'] ?? '';

                  return GestureDetector(
                    onTap: () {
                      // Navigate to the NewsDetailsScreen on tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            title: title,
                            description: description,
                            content: content,
                            imageUrl: imageUrl,
                            url: url,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 233, 175, 89),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (imageUrl.isNotEmpty)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imageUrl,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image, size: 100),
                                ),
                              ),
                            const SizedBox(height: 10),
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Source: $source',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Published on: $formattedDate',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
