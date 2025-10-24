import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_bloc.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_state.dart';

final class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailBloc, PostDetailState>(
      builder: (context, state) {
        switch (state) {
          case PostDetailStateInitial():
            return const Center(child: CircularProgressIndicator());
          case PostDetailStateLoading():
            return const Center(child: CircularProgressIndicator());
          case PostDetailStateError():
            return Center(child: Text(state.error.toString()));
          case PostDetailStateSuccess():
            return Center(child: Text(state.post?.title ?? ""));
        }
      },
    );
  }
}
