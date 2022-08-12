class MasterUri {
  static BaseUrl get baseUrl => BaseUrl();
  static PathBlog get pathBlog => PathBlog();
}

class BaseUrl {
  String get prodUrl => "https://jsonplaceholder.typicode.com";
}

class PathBlog {
  String get postingan => "posts";
}
