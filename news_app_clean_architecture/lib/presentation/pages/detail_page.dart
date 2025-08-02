import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../domain/entities/article.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  const DetailPage({super.key, required this.article});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (article.imageUrl != null)
              Image.network(article.imageUrl!, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(article.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            if (article.author != null)
              Text('By ${article.author}', style: const TextStyle(fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            Text(article.content ?? 'No content available.'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _launchUrl(article.url),
              icon: const Icon(Icons.open_in_browser),
              label: const Text('Read Full Article'),
            ),
          ],
        ),
      ),
    );
  }
}
