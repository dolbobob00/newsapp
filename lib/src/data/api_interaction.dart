import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class INetworkInteraction<T> {
  Future<T> get(String url);
  T transformResponse(http.Response response);
}

class HTTPInteraction<T> implements INetworkInteraction<T> {
  final T Function(dynamic) fromJson;

  HTTPInteraction({required this.fromJson});

  @override
  T transformResponse(http.Response response) {
    final jsonData = json.decode(response.body);
    return fromJson(jsonData);
  }

  @override
  Future<T> get(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return transformResponse(response);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
