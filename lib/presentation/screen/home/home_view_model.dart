import 'package:arunaassignmentoaditya/data/repo/blog_data_source.dart';
import 'package:arunaassignmentoaditya/domain/blog_model/blog_freezed.dart';
import 'package:arunaassignmentoaditya/domain/blog_model/blog_model.dart';
import 'package:arunaassignmentoaditya/domain/blog_model/blog_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogNotifier extends StateNotifier<BlogState> {
  BlogNotifier() : super(const BlogState()) {
    _initGet();
  }

  BlogDataSource blogDataSource = BlogDataSource();
  List? tempList = [];

  _initGet() async {
    state = state.copyWith(isLoading: true);
    List<dynamic>? response = await blogDataSource.loadBlogList();
    if (response == null) {
      state = state.copyWith(isLoading: false);
      return;
    }

    List<BlogModel> responseModelList =
        BlogResponseScreen.fromJson(response).list;
    debugPrint('list blog : ${response.toString()}');
    state = state.copyWith(isLoading: false, list: responseModelList);
  }

  Future<void> refresh() async {
    _initGet();
  }

  loadMorePost() async {
    StringBuffer bf = StringBuffer();

    bf.write('try to request loading ${state.isLoading} ');
    if (state.isLoading) {
      bf.write(' fail');
      return;
    }
    bf.write(' success');
    debugPrint(bf.toString());
    state = state.copyWith(
        isLoading: false, isLoadMoreDone: false, isLoadMoreError: false);

    List<dynamic>? response = await blogDataSource.loadBlogList();

    List<BlogModel> responseModelList =
        BlogResponseScreen.fromJson(response!).list;

    if (responseModelList.isEmpty) {
      // error
      state = state.copyWith(isLoadMoreError: true, isLoading: false);
      return;
    }

    debugPrint('load more ${responseModelList.length}');
    if (responseModelList.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        isLoadMoreDone: true,
      );
    }
  }
}
