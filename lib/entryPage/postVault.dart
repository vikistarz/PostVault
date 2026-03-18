import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../feature/post/presentation/screens/post_list_screen.dart';


class PostVaultApp extends ConsumerStatefulWidget {
  const PostVaultApp({super.key});

  @override
  ConsumerState<PostVaultApp> createState() => _PostVaultAppState();
}

class _PostVaultAppState extends ConsumerState<PostVaultApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'PostVault',
      debugShowCheckedModeBanner: false,
      home: const PostListScreen(),
    );
  }

}