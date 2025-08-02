import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_api_service.dart';
import '../models/article_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService apiService;

  NewsRepositoryImpl(this.apiService);

  @override
  Future<List<Article>> getTopHeadlines() async {
    final List<ArticleModel> models = await apiService.fetchTopHeadlines();
    return models.map((model) => Article(
      title: model.title,
      imageUrl: model.imageUrl,
      author: model.author,
      content: model.content,
      publishedAt: model.publishedAt,
      url: model.url,
    )).toList();
  }
}
