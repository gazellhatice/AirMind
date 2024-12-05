import 'package:flutter/material.dart';

class SelectAdditionalDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select additional data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You can customize this screen later",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text("Active Generators"),
              subtitle: Text("Keep track of the generator schedule"),
              value: true,
              onChanged: (val) {},
            ),
            CheckboxListTile(
              title: Text("Spillway Conditions"),
              subtitle: Text("Find out Spillway conditions"),
              value: false,
              onChanged: (val) {},
            ),
            CheckboxListTile(
              title: Text("Points of Interests"),
              subtitle: Text("Map with locations of fish, restaurants, etc."),
              value: true,
              onChanged: (val) {},
            ),
            CheckboxListTile(
              title: Text("Aquatic Plants"),
              subtitle: Text("Explore the list of aquatic plants"),
              value: false,
              onChanged: (val) {},
            ),
            SizedBox(height: 20),
            // Yeni eklediğimiz Climate News kısmı
            ListTile(
              title: Text("Climate News"),
              subtitle: Text("Read the latest climate change news"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, '/climate_news');
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/main_measurement');
              },
              child: Text("Next"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
