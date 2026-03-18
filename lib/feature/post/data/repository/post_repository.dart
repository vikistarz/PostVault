import '../../../../core/network/api_service.dart';
import '../models/post_models.dart';

class PostRepository {
  final ApiService apiService;

  PostRepository(this.apiService);

  Future<List<PostModel>> getPosts() async {
    final data = await apiService.fetchPosts();
    return data.map((e) => PostModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}