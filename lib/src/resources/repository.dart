import 'dart:async';
import 'package:bloc_eg/src/models/trailer_model.dart';

import 'movie_api_provider.dart';
import 'package:bloc_eg/src/models/item_model.dart';

class Respository {
  final movieApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailer(int movieId) =>
      movieApiProvider.fetchTrailer(movieId);
}
