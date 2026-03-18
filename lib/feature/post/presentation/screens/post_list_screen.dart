import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/post_providers.dart';
import '../widgets/post_card.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(" My Post"),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: postsAsync.when(
        data: (posts) {
          // ✅ Empty State
          if (posts.isEmpty) {
            return const Center(child: Text("No posts"));
          }

          // ✅ Pull to Refresh
          return RefreshIndicator(
            onRefresh: () async {
              ref.refresh(postsProvider);
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (_, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PostCard(post: post),
                );
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (e, _) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text("Error: $e"),
          ),
        ),
      ),
    );
  }
}

//