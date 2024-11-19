import 'package:flutter/material.dart';
import 'models/country_service.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final CountryService _countryService = CountryService();
  List<dynamic>? countries;

  @override
  void initState() {
    super.initState();
    fetchCountryData();
  }

  void fetchCountryData() async {
    countries = await _countryService.fetchCountries();
    setState(() {});
  }

  void showCountryDetails(BuildContext context, dynamic country) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          iconColor: const Color.fromARGB(255, 233, 175, 89),
          title: Text(country['name']['common']),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (country['flags'] != null)
                  Center(
                    child: Image.network(
                      country['flags']['png'],
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 20),
                Text('Capital: ${country['capital']?[0] ?? 'N/A'}'),
                Text('Region: ${country['region'] ?? 'N/A'}'),
                Text('Subregion: ${country['subregion'] ?? 'N/A'}'),
                Text('Population: ${country['population'] ?? 'N/A'}'),
                Text('Area: ${country['area'] ?? 'N/A'} km²'),
                const SizedBox(height: 10),
                if (country['languages'] != null)
                  Text(
                    'Languages: ${country['languages'].values.join(', ')}',
                  ),
                const SizedBox(height: 10),
                if (country['currencies'] != null)
                  Text(
                    'Currency: ${country['currencies'].values.first['name']} (${country['currencies'].values.first['symbol']})',
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 138, 76),
      appBar: AppBar(
        title: const Text('Countries'),
        backgroundColor: const Color.fromARGB(255, 219, 171, 99),
      ),
      body: countries == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: countries!.length,
              itemBuilder: (context, index) {
                final country = countries![index];
                return Card(
                  color: const Color.fromARGB(255, 233, 175, 89),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.network(
                      country['flags']['png'],
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(country['name']['common']),
                    subtitle: Text('Region: ${country['region']}'),
                    onTap: () => showCountryDetails(context, country),
                  ),
                );
              },
            ),
    );
  }
}
