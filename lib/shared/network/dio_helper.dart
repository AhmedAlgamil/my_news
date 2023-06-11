import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      receiveDataWhenStatusError: true,
    );

    dio = Dio(baseOptions);
  }

  static Future getData({
    required String url,
    Map<String, dynamic>? parameters,
  }) async {
    return await dio?.get(
      url,
      queryParameters: parameters,
      onReceiveProgress: (count, total) {

      },
    );
  }
}
