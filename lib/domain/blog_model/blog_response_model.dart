import 'blog_model.dart';

class BlogResponseScreen {
  final List<BlogModel> list;

  BlogResponseScreen({
    required this.list,
  });

  factory BlogResponseScreen.fromJson(List<dynamic> parsedJson) {
    List<BlogModel> list = <BlogModel>[];
    list = parsedJson.map((i) => BlogModel.fromJsonMap(i)).toList();

    return BlogResponseScreen(list: list);
  }
}
