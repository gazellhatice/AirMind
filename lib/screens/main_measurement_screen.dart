import 'package:flutter/material.dart';

class MainMeasurementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neely Henry Lake"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.info))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "375 ft 8 in",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              "Active Gen: 2",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              "120,090 ft³/sec",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
      // Alt navigasyonu kaldırıyoruz.
      bottomNavigationBar: null, // Alt navigasyon burada kaldırıldı.
    );
  }
}
