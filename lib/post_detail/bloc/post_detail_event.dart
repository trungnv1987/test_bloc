import 'package:equatable/equatable.dart';

sealed class PostDetailEvent extends Equatable {
  const PostDetailEvent({required this.id});

  final int id;
  @override
  List<Object> get props => [id];
}

final class PostDetailEventFetched extends PostDetailEvent {
  const PostDetailEventFetched({required super.id});
}
