class BlogModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  BlogModel.fromJsonMap(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        body = json['body'];
}
