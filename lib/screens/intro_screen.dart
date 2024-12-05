import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Arka plan
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade700, Colors.teal.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo veya Başlık
              Text(
                "Airmind",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Hareketli yazı (akarak gelen açıklama)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "Track, improve, and breathe clean air.",
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                    TyperAnimatedText(
                      "Airmind helps you stay aware of air quality like never before.",
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 40),
              // Devam butonu
              ElevatedButton(
                onPressed: () {
                  // LoginScreen ekranına yönlendirme
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
