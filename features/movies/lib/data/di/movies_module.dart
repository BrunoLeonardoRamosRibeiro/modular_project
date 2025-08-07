import 'package:data/network_info/network_info.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/source/cache/movies_local_data_source.dart';
import 'package:movies/data/source/cache/movies_local_data_source_impl.dart';
import 'package:movies/data/source/remote/movies_remote_data_source.dart';
import 'package:movies/data/source/remote/movies_remote_data_source_impl.dart';
import 'package:movies/data/repository/movies_repository_impl.dart';
import 'package:movies/data/service/movies_service.dart';
import 'package:movies/domain/model/cached_movie.dart';
import 'package:movies/domain/repository/movies_repository.dart';
import 'package:movies/domain/usecase/movies_usecase.dart';

@module
abstract class MoviesModule {
  @preResolve
  Future<Box<dynamic>> provideMoviesBox() async {
    Hive.registerAdapter(CachedMovieAdapter());
    return Hive.openBox<dynamic>("moviesBox");
  }

  @lazySingleton
  MoviesService provideMoviesService(Dio dio) {
    return MoviesService(dio);
  }

  @lazySingleton
  MoviesRemoteDataSource provideMoviesRemoteDataSource(
    MoviesService moviesService,
    NetworkInfo networkInfo,
  ) {
    return MoviesRemoteDataSourceImpl(moviesService, networkInfo);
  }

  @lazySingleton
  MoviesLocalDataSource provideMoviesLocalDataSource(Box<dynamic> box) {
    return MoviesLocalDataSourceImpl(box);
  }

  @lazySingleton
  MoviesRepository provideMoviesRepository(
    MoviesRemoteDataSource moviesRemoteDataSource,
    MoviesLocalDataSource moviesLocalDataSource,
  ) {
    return MoviesRepositoryImpl(moviesRemoteDataSource, moviesLocalDataSource);
  }

  @lazySingleton
  MoviesUseCase provideMoviesUseCase(MoviesRepository moviesRepository) {
    return MoviesUseCase(moviesRepository);
  }
}
