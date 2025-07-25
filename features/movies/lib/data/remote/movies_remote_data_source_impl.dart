import 'package:dartz/dartz.dart';
import 'package:data/network/api_safe_call.dart';
import 'package:data/network_info/network_info.dart';
import 'package:domain/model/failure.dart';
import 'package:movies/data/remote/movies_remote_data_source.dart';
import 'package:movies/data/response/movies_response.dart';
import 'package:movies/data/service/movies_service.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final MoviesService moviesService;
  final NetworkInfo networkInfo;

  MoviesRemoteDataSourceImpl(this.moviesService, this.networkInfo);

  @override
  Future<Either<Failure, MoviesResponse>> getMovies() async {
    return safeApiCall(networkInfo, () async {
      final response = await moviesService.getMovies();
      return response.data;
    });
  }
}
