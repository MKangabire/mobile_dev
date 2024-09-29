import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion App',
      theme: ThemeData(),
      home: const TempConversion(title: 'Temperature Conversion App'),
    );
  }
}

class TempConversion extends StatefulWidget {
  const TempConversion({super.key, required this.title});

  final String title;

  @override
  _TempConversionState createState() => _TempConversionState();
}

class _TempConversionState extends State<TempConversion> {
  final _temperatureController = TextEditingController();
  String _convertedTemperature = '';
  String _conversionHistory = '';
  bool _isFahrenheitToCelsius = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 15, 24),
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle:
            const TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Convert temperatures here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _temperatureController,
                style: const TextStyle(color: Colors.white), // White text color
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the temperature to be converted',
                  hintStyle:
                      TextStyle(color: Colors.white70), // Hint text color
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: _isFahrenheitToCelsius,
                    onChanged: (value) {
                      setState(() {
                        _isFahrenheitToCelsius = value!;
                      });
                    },
                  ),
                  const Text(
                    'Fahrenheit to Celsius',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Radio<bool>(
                    value: false,
                    groupValue: _isFahrenheitToCelsius,
                    onChanged: (value) {
                      setState(() {
                        _isFahrenheitToCelsius = value!;
                      });
                    },
                  ),
                  const Text(
                    'Celsius to Fahrenheit',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertTemperature,
                child: const Text('Convert'),
              ),
              const SizedBox(height: 20),
              Text(
                _convertedTemperature,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _clearHistory, // Clear history button
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Clear History'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Conversion History',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                _conversionHistory,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _convertTemperature() {
    double? inputTemperature = double.tryParse(_temperatureController.text);
    if (inputTemperature == null) return;

    double convertedTemp;
    String history;

    if (_isFahrenheitToCelsius) {
      // Fahrenheit to Celsius conversion
      convertedTemp = (inputTemperature - 32) * 5 / 9;
      history =
          'F to C: ${inputTemperature.toStringAsFixed(1)} => ${convertedTemp.toStringAsFixed(1)}';
    } else {
      // Celsius to Fahrenheit conversion
      convertedTemp = (inputTemperature * 9 / 5) + 32;
      history =
          'C to F: ${inputTemperature.toStringAsFixed(1)} => ${convertedTemp.toStringAsFixed(1)}';
    }

    setState(() {
      _convertedTemperature =
          'Converted Temperature: ${convertedTemp.toStringAsFixed(2)}';
      _conversionHistory += '$history\n';
    });
  }

  void _clearHistory() {
    setState(() {
      _conversionHistory = '';
    });
  }
}
