import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/Categories_new_model.dart';
import '../models/news_channels_headline_model.dart';

class NewsRepository {
  Future<NewsChannelHeadlinesModel> fetchNewsChannelsHeadlineApi(String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=Enter Your Api Key';
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(
      String categoryName) async {
      String url = 'https://newsapi.org/v2/everything?q=${categoryName}&apiKey=Enter Your Api Key';
      final response = await http.get(Uri.parse(url));

      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return CategoriesNewsModel.fromJson(body);
      }
      throw Exception('Error');
  }
}