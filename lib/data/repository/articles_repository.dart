import 'package:newsy/data/data_provider/articles_data_provider.dart';
import 'package:newsy/data/models/articles_model.dart';

class ArticlesRepository {
  final ArticlesDataProvider articles = ArticlesDataProvider();

  Future<ArticlesResponse> getEverything(String query) async {
    final response = articles.getEverything(query);
    return response;
  }

  Future<List<Articles>> getTopHeadlines([String? category]) async {
    final response = await articles.getTopHeadlines(category ?? "");
    print(response.totalResults);
    return response.articles!;
  }
}
