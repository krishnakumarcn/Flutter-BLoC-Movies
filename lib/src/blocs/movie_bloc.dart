import 'package:rxdart/rxdart.dart';
import 'package:bloc_eg/src/models/item_model.dart';
import '../resources/repository.dart';

class MovieBloc {
  final _respository = Respository();
  final _movieFetcher = BehaviorSubject<ItemModel>();
  Observable<ItemModel> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _respository.fetchAllMovies();
    _movieFetcher.sink.add(itemModel);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final bloc = MovieBloc();
