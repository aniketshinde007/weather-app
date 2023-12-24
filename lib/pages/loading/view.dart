import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class LoadingView extends ConsumerWidget {
  final Widget appbarIcon;
  final Widget appbarTitle;
  const LoadingView({super.key, required this.appbarIcon, required this.appbarTitle,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: appbarIcon,
            title: appbarTitle,
          ),
          const SliverToBoxAdapter(
            child: Gap(40),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}