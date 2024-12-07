class ClimateNews {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final DateTime publishedAt;

  ClimateNews({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.publishedAt,
  });

  factory ClimateNews.fromJson(Map<String, dynamic> json) {
    return ClimateNews(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'publishedAt': publishedAt.toIso8601String(),
    };
  }
}
