import 'package:flutter/material.dart';

class ActiveGeneratorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Generators"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text("Active Generators: 3"),
                subtitle: Text("Generator Power: 11,353 ft³/sec"),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Receive Notification When:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text("Generators turn on"),
              value: true,
              onChanged: (val) {},
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to set up notifications
              },
              child: Text("Set up notifications for other lakes"),
            ),
          ],
        ),
      ),
    );
  }
}
