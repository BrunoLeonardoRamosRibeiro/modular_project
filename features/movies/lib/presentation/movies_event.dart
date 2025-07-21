import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => [];
}

class MoviesGetter extends MoviesEvent {
  @override
  List<Object?> get props => [];
}
