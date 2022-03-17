import 'dart:convert';

import 'package:newsy/common/app_constants.dart';
import 'package:http/http.dart' as http;

import '../models/articles_model.dart';

class ArticlesDataProvider {
  Future<ArticlesResponse> getEverything(String query) async {
    final url =
        "${AppConstants.baseUrl}/everything?q=$query&apiKey=${AppConstants.apiKey}";

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final decodedResponse = jsonDecode(response.body);

    return ArticlesResponse.fromJson(decodedResponse);
  }

  Future<ArticlesResponse> getTopHeadlines([String category = ""]) async {
    final url =
        "${AppConstants.baseUrl}/top-headlines?country=in&category=$category&apiKey=${AppConstants.apiKey}";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final decodedResponse = jsonDecode(response.body);

    return ArticlesResponse.fromJson(decodedResponse);
  }
}
