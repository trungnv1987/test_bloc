part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PostFetched extends PostEvent {}

final class PostItemClicked extends PostEvent {
  PostItemClicked({required this.post});
  final Post post;
  @override
  List<Object> get props => [post];
}
