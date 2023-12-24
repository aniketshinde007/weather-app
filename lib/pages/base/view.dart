import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/pages/maps/view.dart';

import '../home/view.dart';
import '../settings/view.dart';

part "view.g.dart";

@riverpod
class SelectedNavigationIndexNotifier extends _$SelectedNavigationIndexNotifier {
  @override
  int build() => 0;

  void setSelectedIndex(int value) => state = value;
}

class WeatherBaseView extends ConsumerWidget {
  const WeatherBaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentIndex = ref.watch(selectedNavigationIndexNotifierProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeView(),
          MapsView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home), 
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map), 
            label: 'Maps'
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined), 
            selectedIcon: Icon(Icons.settings), 
            label: 'Settings'
          )
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: ref.read(selectedNavigationIndexNotifierProvider.notifier).setSelectedIndex,
      ),
    );
  }
}