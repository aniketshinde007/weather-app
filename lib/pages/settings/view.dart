import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
              const ListTile(
                leading: Icon(Icons.person_outlined),
                title: Text('Account'),
                subtitle: Text('Change your account details'),
              ),
              const ListTile(
                leading: Icon(Icons.color_lens_outlined),
                title: Text('Theme'),
                subtitle: Text('Change application theme'),
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