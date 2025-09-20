// // import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:clean_architecture_using_bloc/feaucture/notes_app/data/models/note_model.dart';
// import 'package:retrofit/dio.dart';
// import 'package:retrofit/http.dart';
//
// import '../../../../../core/contents/contents.dart';
// part "news_api_service.g.dart";
//
// @RestApi(
//   baseUrl:
//       'https://newsapi.org/v2/everything?q=Apple&from=2025-09-16&sortBy=popularity&apiKey=API_KEY',
// )
// abstract class NewsApiService {
//   factory NewsApiService(Dio dio) = _NewsApiService;
//   @GET('/top-headlines')
//   Future<HttpResponse<List<ArticalModel>>> getNewsArtical({
//     @Query("apikey") String? apikey,
//     @Query("country") String? country,
//     @Query("category") String? category,
//   });
// }
