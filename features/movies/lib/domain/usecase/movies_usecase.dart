import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:movies/domain/model/movie_model.dart';
import 'package:movies/domain/repository/movies_repository.dart';

class MoviesUseCase implements BaseUseCase<String, List<Movie>> {
  final MoviesRepository moviesRepository;

  MoviesUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> execute(String input) async {
    return await moviesRepository.getMovies();
  }
}
