import 'package:flutter/material.dart';
import '../../../domain/entities/article.dart';
import 'package:intl/intl.dart';

class NewsTile extends StatelessWidget {
  final Article article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: article.imageUrl != null
          ? Image.network(article.imageUrl!, width: 100, fit: BoxFit.cover)
          : const Icon(Icons.image_not_supported),
      title: Text(article.title),
      subtitle: Text(DateFormat.yMMMd().format(article.publishedAt)),
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: article);
      },
    );
  }
}
