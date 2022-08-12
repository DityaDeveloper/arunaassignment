import 'package:freezed_annotation/freezed_annotation.dart';

import 'blog_model.dart';

part 'blog_freezed.freezed.dart';

@freezed
abstract class BlogState with _$BlogState {
  const factory BlogState({
    @Default(1) int page,
    @Default([]) List<BlogModel> list,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadMoreError,
    @Default(false) bool isLoadMoreDone,
  }) = _BlogState;

  const BlogState._();
}
