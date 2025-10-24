part of 'post_bloc.dart';

enum PostStatus { initial, success, failure, selected }

final class PostsState extends Equatable {
  const PostsState({
    this.status = PostStatus.initial,
    this.posts,
    this.hasReachedMax = false,
    this.selectedPost,
  });

  factory PostsState.selectedPost(Post post) {
    return PostsState(
      status: PostStatus.selected,
      selectedPost: post,
    );
  }
  
  final PostStatus status;
  final List<Post>? posts;
  final Post? selectedPost;
  final bool hasReachedMax;

  PostsState copyWith({
    PostStatus? status,
    List<Post>? posts,
    Post? selectedPost,
    bool? hasReachedMax,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      selectedPost: selectedPost ?? this.selectedPost,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax''';
  }

  @override
  List<Object> get props => [status, hasReachedMax];
}
