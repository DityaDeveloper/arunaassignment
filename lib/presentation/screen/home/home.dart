import 'package:arunaassignmentoaditya/data/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widget/blog_widget.dart';
import '../../widget/loading.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int oldLength = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              hintText: 'Masukan kata kunci disini...',
              hintStyle: TextStyle(color: Colors.white)),
          onChanged: (newValue) {
            ref.read(keyProvider.notifier).state = newValue;
          },
        ),
      ),
      body: Consumer(
        builder: (ctx, watch, child) {
          final isLoading = ref.watch(blogProvider).isLoading;
          final blogs = ref.watch(blogSearchProvider.notifier).state;

          oldLength = blogs.length;
          // init data or error
          if (blogs.isEmpty) {
            // error case
            if (isLoading == false) {
              return const Center(
                child: Text('Data tidak ditemukan'),
              );
            }
            return const LoadingProgress(
              loadingColor: Colors.black,
            );
          }
          return RefreshIndicator(
              onRefresh: () {
                return ref.read(blogProvider.notifier).refresh();
              },
              child: BlogWidget(
                blog: blogs,
              ));
        },
      ),
    );
  }
}
