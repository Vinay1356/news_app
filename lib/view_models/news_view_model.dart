import 'package:news_app/models/Categories_new_model.dart';
import 'package:news_app/models/news_channels_headline_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelsHeadlineApi(
      String channelName) async {
    final response = await _rep.fetchNewsChannelsHeadlineApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(
      String categoryName) async {
    final response = await _rep.fetchCategoriesNewsApi(categoryName);
    return response;
  }
}
