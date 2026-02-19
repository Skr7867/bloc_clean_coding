import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';

import '../../config/data/response/api_response.dart';
import '../../model/movies/movies_model.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository})
    : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(
    MoviesFetched event,
    Emitter<MoviesState> emit,
  ) async {
    await moviesRepository
        .fetchMoviesList()
        .then((value) {
          emit(state.copyWith(moviesList: ApiResponse.completed(value)));
        })
        .onError((error, stacktrace) {
          emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
        });
  }
}
