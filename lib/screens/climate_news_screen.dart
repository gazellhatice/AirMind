import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// İklim haberlerini çeken sınıf
class ClimateNewsScreen extends StatefulWidget {
  @override
  _ClimateNewsScreenState createState() => _ClimateNewsScreenState();
}

class _ClimateNewsScreenState extends State<ClimateNewsScreen> {
  List<dynamic> _news = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  // API'den haberleri çekmek
  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse('https://api.yournewsapi.com/climate-news'));

    if (response.statusCode == 200) {
      setState(() {
        _news = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load climate news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Climate News'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          final newsItem = _news[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(newsItem['title']),
              subtitle: Text(newsItem['description']),
              onTap: () {
                // Burada haberin detaylarına yönlendirebilirsiniz
              },
            ),
          );
        },
      ),
    );
  }
}
