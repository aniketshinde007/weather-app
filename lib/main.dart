import 'package:flutter/material.dart';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/services/theme.dart';

import 'services/package.dart';
import 'services/database.dart';
import '../routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Application package initialization
  await Package.setPackageInfo();

  // Database initialization
  await DatabaseProvider().initiateDatabase();

  // Run app
  runApp(const ProviderScope(child: MyApp()));
}

// Set app color
const _brandColor = Color(0xFF12263C);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Return dynamic color widget for dynamic color support in material you
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: _brandColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: _brandColor,
            brightness: Brightness.dark,
          );
        }

        // Return material app with go router
        return MaterialApp.router(
          title: 'Weather App',
          theme: ThemeData(
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
          ),
          themeMode: ref.watch(appThemeModeProvider),
          routerConfig: weatherRouter,
        );
      },
    );
  }
}
