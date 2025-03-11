import 'package:flutter/material.dart';
import '../domain/models/news_model.dart';
import '../repositories/news_repository.dart';

class NewsProvider extends ChangeNotifier {
  final NewsRepository _repository;

  List<NewsModel>? _news;
  List<NewsModel>? _filteredNews;
  String? _error;
  bool _isLoading = false;
  String _searchQuery = '';

  NewsProvider(this._repository);

  List<NewsModel>? get news => _news;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> fetchNews({bool showLoading = true}) async {
    if (showLoading) {
      _isLoading = true;
      notifyListeners();
    }

    try {
      _news = await _repository.getNews();
      //!Shuffle added cuz we catching same info from api
      //! idk its my problem or api problem
      _news?.shuffle();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Поиск по заголовку
  void searchNews(String query) {
    _searchQuery = query.toLowerCase();
    if (_news == null) return;

    if (_searchQuery.isEmpty) {
      _filteredNews = null;
    } else {
      _filteredNews = _news!.where((news) {
        final titleMatch = news.title.toLowerCase().contains(_searchQuery);
        return titleMatch;
      }).toList();
    }
    notifyListeners();
  }

  //Получаем отфильтрованные новости или все новости
  List<NewsModel>? get filteredNews =>
      _searchQuery.isEmpty ? _news : _filteredNews;
}
