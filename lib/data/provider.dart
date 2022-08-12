import 'package:arunaassignmentoaditya/domain/blog_model/blog_freezed.dart';
import 'package:arunaassignmentoaditya/domain/blog_model/blog_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/screen/home/home_view_model.dart';

final keyProvider = StateProvider<String>((ref) {
  return '';
});

final blogProvider = StateNotifierProvider<BlogNotifier, BlogState>((ref) {
  return BlogNotifier();
});

final blogSearchProvider = StateProvider<List<BlogModel>>((ref) {
  final searchState = ref.watch(blogProvider);
  final key = ref.watch(keyProvider);

  return searchState.list
      .where((element) =>
          element.title.contains(key) ||
          element.body.contains(key) ||
          element.id.toString().contains(key) ||
          element.userId.toString().contains(key))
      .toList();
});
