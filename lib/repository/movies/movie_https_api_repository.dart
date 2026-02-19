import 'package:bloc_clean_coding/config/apiUrls/api_urls.dart';
import 'package:bloc_clean_coding/config/data/network/network_services_api.dart';
import 'package:bloc_clean_coding/model/movies/movies_model.dart';
import 'package:bloc_clean_coding/repository/movies/movies_repository.dart';

class MovieHttpsApiRepository implements MoviesRepository {
  final _apiServices = NetworkApiServices();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(ApiUrls.moviesApi);

    return MoviesModel.fromJson(response);
  }
}
