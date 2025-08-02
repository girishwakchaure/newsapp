import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';
import '../../core/utils/constants.dart';
import '../../core/services/database_helper.dart';

class NewsApiService {
  final dbHelper = DatabaseHelper();

  Future<List<ArticleModel>> fetchTopHeadlines() async {
    try {
      final uri = Uri.parse('${Constants.baseUrl}/top-headlines?country=us&apiKey=${Constants.apiKey}');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];

        final articleModels = articles
            .map((json) => ArticleModel.fromJson(json))
            .toList();

        await dbHelper.insertArticles(articleModels); 

        return articleModels;
      } else {
        throw Exception('Failed to fetch articles: ${response.statusCode}');
      }
    } catch (e) {
      
      return await dbHelper.getCachedArticles();
    }
  }
}
