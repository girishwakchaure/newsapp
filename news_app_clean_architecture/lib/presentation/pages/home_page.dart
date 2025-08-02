import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/news_provider.dart';
import '../widgets/news_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(filteredArticlesProvider);
    final isLoading = ref.watch(allArticlesProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search articles...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),
          if (isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (articles.isEmpty)
            const Expanded(child: Center(child: Text('No matching articles')))
          else
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    NewsTile(article: articles[index]),
              ),
            ),
        ],
      ),
    );
  }
}
