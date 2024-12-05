import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimateNewsScreen extends StatefulWidget {
  @override
  _ClimateNewsScreenState createState() => _ClimateNewsScreenState();
}

class _ClimateNewsScreenState extends State<ClimateNewsScreen> {
  List<dynamic> _news = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=climate&apiKey=18c90630cae94cb0ac0158496f86e9fa';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> newsData = json.decode(response.body);

        setState(() {
          _news = newsData['articles'] ?? []; // Haberler 'articles' anahtarında
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load news. Status code: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'An error occurred: $error';
        _isLoading = false;
      });
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
          : _errorMessage != null
          ? Center(
        child: Text(
          _errorMessage!,
          style: TextStyle(color: Colors.red),
        ),
      )
          : ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          final newsItem = _news[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(newsItem['title'] ?? 'No Title'),
              subtitle: Text(
                newsItem['description'] ?? 'No Description',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                // Haber detayına gitmek için URL'yi açabilirsiniz
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(newsItem['title'] ?? 'No Title'),
                    content: Text(newsItem['content'] ?? 'No Content'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
