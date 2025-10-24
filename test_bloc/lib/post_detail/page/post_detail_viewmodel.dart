import 'package:flutter/foundation.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_bloc.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_event.dart';

final class PostDetailViewModel {
  PostDetailViewModel({required this.id, required this.bloc});
  final int id;
  final PostDetailBloc bloc;

  Future<void> getPost() async {
    bloc.add(PostDetailEventFetched(id: id));
  }

  void dispose() {
    debugPrint("PostDetailViewModel dispose");
    bloc.close();
  }
}
