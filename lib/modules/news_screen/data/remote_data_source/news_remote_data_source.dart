import 'dart:io';

import 'package:dio/dio.dart';
import 'package:g_news/modules/news_screen/data/models/AppNewsModel.dart';

import '../../../../shared/network/dio_helper.dart';

class NewsRemoteDataSource {
  String? responseMessage;
  Future<AppNewsModel?> getNews({
    String? category,
    int pageSize = 20,
    String? query,
  }) async {
    try {
       final res = await DioHelper.getData(
        url: "top-headlines",
        parameters: {
          "apiKey": "9e911f7064eb49649342c798074432f4",
          "country": "eg",
          "pageSize": "$pageSize",
          if (category != "") "category": category,
          if (query != "") "q": query
        },
      );
       return AppNewsModel.fromJson(res.data);
    } catch (error) {
      if (error is DioError) {
        if (error.message.contains("SocketException")) {
          throw SocketException;
        }
      }
    }
  }
}
