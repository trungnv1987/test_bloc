import 'package:equatable/equatable.dart';
import 'package:flutter_infinite_list/posts/models/post.dart';

sealed class PostDetailState extends Equatable {
  const PostDetailState({
    this.post,
    this.isLoading = false,
    this.error,
  });
  final Post? post;
  final bool isLoading;
  final Object? error;

  @override
  List<Object?> get props => [post, isLoading, error];
}

final class PostDetailStateInitial extends PostDetailState {
  const PostDetailStateInitial() : super();
}

final class PostDetailStateLoading extends PostDetailState {
  const PostDetailStateLoading() : super(isLoading: true);
}

final class PostDetailStateError extends PostDetailState {
  const PostDetailStateError({required super.error}) : super();
}

final class PostDetailStateSuccess extends PostDetailState {
  const PostDetailStateSuccess({required super.post}) : super();
}
