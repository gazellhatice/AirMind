import 'package:flutter/material.dart';

// Ekranlar
import 'screens/select_additional_data_screen.dart';
import 'screens/main_measurement_screen.dart';
import 'screens/active_generators_screen.dart';
import 'screens/climate_news_screen.dart';  // Yeni ekranı ekledik

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lake Management App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SelectAdditionalDataScreen(),
      routes: {
        '/main_measurement': (context) => MainMeasurementScreen(),
        '/active_generators': (context) => ActiveGeneratorsScreen(),
        '/climate_news': (context) => ClimateNewsScreen(), // Yeni rota ekledik
      },
    );
  }
}
