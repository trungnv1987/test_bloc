import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_event.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_state.dart';
import 'package:flutter_infinite_list/post_detail/usecases/get_post_detail_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

final class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc({required this.getPostDetailUsecase, required this.id})
    : super(const PostDetailStateInitial()) {
    on<PostDetailEventFetched>(
      _onFetched,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetPostDetailUsecase getPostDetailUsecase;
  final int id;

  Future<void> _onFetched(
    PostDetailEventFetched event,
    Emitter<PostDetailState> emit,
  ) async {
    emit(const PostDetailStateLoading());
    try {
      final post = await getPostDetailUsecase.call(event.id);
      if (post == null) {
        emit(const PostDetailStateError(error: "Post not found"));
        return;
      }
      emit(PostDetailStateSuccess(post: post));
    } catch (e) {
      emit(PostDetailStateError(error: e));
    }
  }
}
