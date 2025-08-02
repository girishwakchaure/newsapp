import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/article.dart';
import '../../../domain/usecases/get_top_headlines.dart';
import '../../../data/datasources/news_api_service.dart';
import '../../../data/repositories/news_repository_impl.dart';


final _newsRepoProvider = Provider((ref) {
  return NewsRepositoryImpl(NewsApiService());
});


final _getHeadlinesUseCaseProvider = Provider((ref) {
  final repo = ref.watch(_newsRepoProvider);
  return GetTopHeadlines(repo);
});


final allArticlesProvider = FutureProvider<List<Article>>((ref) async {
  final getHeadlines = ref.watch(_getHeadlinesUseCaseProvider);
  return await getHeadlines();
});


final searchQueryProvider = StateProvider<String>((ref) => '');


final filteredArticlesProvider = Provider<List<Article>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase().trim();
  final asyncArticles = ref.watch(allArticlesProvider);

  return asyncArticles.when(
    data: (articles) {
      if (query.isEmpty) return articles;

      return articles.where((article) {
        final title = article.title.toLowerCase();
        final content = article.content?.toLowerCase() ?? '';
        return title.contains(query) || content.contains(query);
      }).toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
