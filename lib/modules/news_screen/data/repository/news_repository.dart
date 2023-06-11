import 'package:g_news/modules/news_screen/data/remote_data_source/news_remote_data_source.dart';

import '../models/AppNewsModel.dart';

class NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSource();

  Future<AppNewsModel?> getNews({
    required String? category,
    required int? pageSize,
    required String? query,
  }) async {
    try {
      return newsRemoteDataSource
          .getNews(category: category, pageSize: pageSize!, query: query);
    } catch (error) {
      rethrow;
    }
  }
}
