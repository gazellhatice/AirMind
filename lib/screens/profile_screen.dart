import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user_placeholder.png'), // Profil fotoğrafı
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'User Name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'user@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Divider(height: 40),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Account Settings'),
              onTap: () {
                // Hesap ayarlarına yönlendirme
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy Policy'),
              onTap: () {
                // Gizlilik politikası ekranı
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                // Çıkış işlemi
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
