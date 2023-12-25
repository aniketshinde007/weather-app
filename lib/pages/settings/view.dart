import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/pages/building/view.dart';
import 'package:weather/services/theme.dart';

import '../../services/package.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
          ),
          SliverList.list(
            children: [
              ListTile(
                leading: const Icon(Icons.location_city_outlined),
                title: const Text('Current City'),
                subtitle: const Text('Nashik, MH, India'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BuildingView(
                  appbarTitle: Text('Current City')
                ))),
              ),
              ListTile(
                leading: const Icon(Icons.color_lens_outlined),
                title: const Text('Theme'),
                subtitle: const Text('Change application theme'),
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Choose theme'),
                      contentPadding: EdgeInsets.zero,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: ThemeMode.values.map((theme) => RadioListTile.adaptive(
                          title: Text(theme.fullName),
                          value: theme,
                          groupValue: ref.read(appThemeModeProvider),
                          onChanged: (theme) => ref.read(appThemeModeProvider.notifier).changeTheme(theme as ThemeMode)
                        )).toList()
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK')
                        ),
                      ],
                    )
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outlined),
                title: const Text('Licenses'),
                subtitle: const Text('Licenses of the application'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LicensePage(
                    applicationName: 'Weather App',
                    applicationIcon: const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage('assets/icons/icon.png'),
                    ),
                    applicationVersion: Package.packageInfo.version,
                  ))
                ),
              ),
            ]
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                '${Package.packageInfo.appName} ${Package.packageInfo.version} (${Package.packageInfo.buildNumber})',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(16),
          )
        ],
      ),
    );
  }
}