import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/select_additional_data_screen.dart';
import 'screens/main_measurement_screen.dart';
import 'screens/active_generators_screen.dart';
import 'screens/climate_news_screen.dart';
import 'screens/profile_screen.dart'; // Profil ekranını ekledik

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Airmind App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: IntroScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/select_data': (context) => MainNavigationScreen(),
        '/main_measurement': (context) => MainMeasurementScreen(),
        '/active_generators': (context) => ActiveGeneratorsScreen(),
        '/climate_news': (context) => ClimateNewsScreen(),
        '/profile': (context) => ProfileScreen(), // Profil için rota
      },
    );
  }
}

// Ana Navigasyon Çubuğu ile Ana Ekran
class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    SelectAdditionalDataScreen(),
    MainMeasurementScreen(),
    ClimateNewsScreen(),
    ProfileScreen(), // Profil ekranı eklendi
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Measurements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Climate News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
