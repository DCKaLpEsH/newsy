import 'package:newsy/data/data_provider/articles_data_provider.dart';
import 'package:newsy/data/models/articles_model.dart';

class ArticlesRepository {
  final ArticlesDataProvider articles = ArticlesDataProvider();

  Future<ArticlesResponse> getEverything(String query) async {
    final response = articles.getEverything(query);
    return response;
  }

  Future<ArticlesResponse> getTopHeadlines(String query) async {
    final response = articles.getTopHeadlines();
    return response;
  }
}
