import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_service.dart';
import '../../data/models/post_models.dart';
import '../../data/repository/post_repository.dart';


final apiServiceProvider = Provider((ref) => ApiService());

final postRepositoryProvider = Provider(
      (ref) => PostRepository(ref.read(apiServiceProvider)),
);

final postsProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.read(postRepositoryProvider).getPosts();
});

class FavoriteNotifier extends StateNotifier<Set<int>> {
  FavoriteNotifier() : super({});

  void toggleFavorite(int postId) {
    if (state.contains(postId)) {
      state = {...state}..remove(postId);
    } else {
      state = {...state, postId};
    }
  }
}

final favoriteProvider =
StateNotifierProvider<FavoriteNotifier, Set<int>>((ref) => FavoriteNotifier());