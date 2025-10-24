import 'package:flutter_infinite_list/post_detail/repos/post_detail_repo.dart';
import 'package:flutter_infinite_list/posts/models/post.dart';

final class GetPostDetailUsecase {
  GetPostDetailUsecase({required this.postDetailRepo});
  
  final PostDetailRepo postDetailRepo;

  Future<Post?> call(int id) async {
    return postDetailRepo.fetchPost(id);
  }
}
