import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../response/movies_response.dart';

part 'movies_service.g.dart';

const String baseUrl =
    "https://api.mockfly.dev/mocks/6a300495-3739-436b-9331-d4e0e241388e";

@RestApi(baseUrl: baseUrl)
abstract class MoviesService {
  factory MoviesService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger errorLogger,
  }) = _MoviesService;

  @GET("/entertainment/movies")
  Future<HttpResponse<MoviesResponse>> getMovies();
}
