import '../domain/models/news_model.dart';
import '../domain/interactors/api_interaction.dart';

class NewsRepository {
  final HTTPInteraction<List<NewsModel>> _api;

  NewsRepository()
      : _api = HTTPInteraction<List<NewsModel>>(
          fromJson: (dynamic json) => NewsModel.fromJsonList(json as List<dynamic>),
        );

  Future<List<NewsModel>> getNews() async {
    return await _api.get('https://jsonplaceholder.typicode.com/posts');
  }
}
