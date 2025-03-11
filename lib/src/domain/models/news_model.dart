class NewsModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  NewsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  static List<NewsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NewsModel.fromJson(json)).toList();
  }
}
