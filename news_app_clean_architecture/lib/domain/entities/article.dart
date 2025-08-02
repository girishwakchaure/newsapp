class Article {
  final String title;
  final String? imageUrl;
  final String? author;
  final String? content;
  final DateTime publishedAt;
  final String url;

  Article({
    required this.title,
    this.imageUrl,
    this.author,
    this.content,
    required this.publishedAt,
    required this.url,
  });
}
