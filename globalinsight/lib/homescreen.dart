import 'package:flutter/material.dart';
import 'countries.dart';
import 'news.dart';
// import 'weather.dart'; // Uncomment this if you have the WeatherScreen file

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 138, 76),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 171, 99),
        title: const Center(
          child: Text(
            'GLOBAL INSIGHT',
            style: TextStyle(
              color: Color.fromARGB(255, 33, 27, 51),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome to Global Insight',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Uncomment and modify if you have the WeatherScreen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const WeatherScreen(city: ''),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.cloud,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5), // Spacing between icon and text
                      Text('Weather'),
                    ],
                  ),
                ),
                const SizedBox(width: 8), // Spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CountryScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.flag,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text('Countries'),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.newspaper_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5), // Spacing between icon and text
                      Text('News'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
