import 'dart:async';
import 'package:bloc_eg/src/models/trailer_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:bloc_eg/src/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '49290b7c45cc7b4a228d4e265bad9b27';


  Future<ItemModel> fetchMovieList() async {
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    if (200 == response.statusCode) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed fetchin');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response = await client
        .get("https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$_apiKey");
    if (200 == response.statusCode) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed fetchin trailer');
    }
  }
}
