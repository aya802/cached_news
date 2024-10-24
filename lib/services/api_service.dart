//
//
// import 'package:dio/dio.dart';
//
// import '../models/news_model.dart';
//
// class ApiService {
//   Dio dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://newsapi.org/v2/',
//       receiveDataWhenStatusError: true,
//     ),
//   );
//
//   Future<List<ArticleModel>> getHeadLines(
//       {required Map<String, dynamic> data, required String path}) async {
//     try {
//       Response response = await dio.get(path, queryParameters: data);
//       Map<String, dynamic> newsData = response.data;
//       List articles = newsData['articles'];
//
//       List<ArticleModel> articleList = [];
//
//       for (var article in articles) {
//         ArticleModel articleModel = ArticleModel.fromJson(article);
//         articleList.add(articleModel);
//       }
//       return articleList;
//     } catch (e) {
//       return [];
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import '../models/news_model.dart';

class ApiService {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      receiveDataWhenStatusError: true,
    ),
  )..interceptors.add(DioCacheManager(
      CacheConfig(baseUrl: "https://newsapi.org/v2/"))
      .interceptor);

  Future<List<ArticleModel>> getHeadLines({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      Response response = await dio.get(
        path,
        queryParameters: data,
        options: buildCacheOptions(Duration(days: 7)), // Cache data for 7 days
      );
      List articles = response.data['articles'];
      return articles.map((article) => ArticleModel.fromJson(article)).toList();
    } catch (e) {
      return [];
    }
  }
}

