import 'package:flutter_infinite_list/post_detail/repos/post_detail_repo.dart';
import 'package:flutter_infinite_list/posts/models/post.dart';

final class PostDetailRepoImpl implements PostDetailRepo {
  @override
  Future<Post?> fetchPost(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Post(id: id, title: "post title", body: "post body");
  }
}
