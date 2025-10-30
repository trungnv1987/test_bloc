import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_bloc.dart';
import 'package:flutter_infinite_list/post_detail/page/post_detail_view.dart';
import 'package:flutter_infinite_list/post_detail/page/post_detail_viewmodel.dart';
import 'package:flutter_infinite_list/post_detail/repos/post_detail_repo_impl.dart';
import 'package:flutter_infinite_list/post_detail/usecases/get_post_detail_usecase.dart';

final class PostDetailPage extends StatefulWidget {
  final int postId;
  const PostDetailPage({super.key, required this.postId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late final PostDetailViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = PostDetailViewModel(
      id: widget.postId,
      bloc: PostDetailBloc(
        getPostDetailUsecase: GetPostDetailUsecase(
          postDetailRepo: PostDetailRepoImpl(),
        ),
        id: widget.postId,
      ),
    );
    viewModel.getPost();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider<PostDetailViewModel>.value(
        value: viewModel,
        child: BlocProvider(
          create: (_) => viewModel.bloc,
          child: const PostDetailView(),
        ),
      ),
    );
  }
}
