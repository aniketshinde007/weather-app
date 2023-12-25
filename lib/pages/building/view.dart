import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/svgs.dart';

class BuildingView extends ConsumerWidget {
  final Widget appbarTitle;
  const BuildingView({super.key, required this.appbarTitle,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: appbarTitle,
          ),
          const SliverToBoxAdapter(
            child: Gap(40),
          ),
          SliverToBoxAdapter(
            child: SvgPicture.string(
              SVGs.buildingBlocks,
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(40),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Page under development',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}