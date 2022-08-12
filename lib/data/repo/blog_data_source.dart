import 'package:flutter/foundation.dart';

import '../../application/uri_constant.dart';
import '../network/base_network.dart';

class BlogDataSource {
  Future<dynamic> loadBlogList() async {
    String pathUrl = MasterUri.pathBlog.postingan;
    debugPrint("testing : $pathUrl");
    return BaseNetwork().getList(pathUrl);
  }
}
