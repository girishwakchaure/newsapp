class ArticleModel {
  final String title;
  final String? imageUrl;
  final String? author;
  final String? content;
  final DateTime publishedAt;
  final String url;

  ArticleModel({
    required this.title,
    this.imageUrl,
    this.author,
    this.content,
    required this.publishedAt,
    required this.url,
  });

  
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      imageUrl: json['urlToImage'],
      author: json['author'],
      content: json['content'],
      publishedAt: DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.now(),
      url: json['url'] ?? '',
    );
  }

  
  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'],
      author: map['author'],
      content: map['content'],
      publishedAt: DateTime.tryParse(map['publishedAt'] ?? '') ?? DateTime.now(),
      url: map['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'author': author,
      'content': content,
      'publishedAt': publishedAt.toIso8601String(),
      'url': url,
    };
  }
}
