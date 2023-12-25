import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/env/env.dart';

class MapsView extends ConsumerWidget {
  final String weatherMapType;
  const MapsView({super.key, required this.weatherMapType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(19.85, 74),
        initialZoom: 4.5,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'in.anishi.weather',
        ),
        TileLayer(
          urlTemplate: 'https://tile.openweathermap.org/map/$weatherMapType/{z}/{x}/{y}.png?appid=${Env.openWeatherKey}&area=worldview',
          userAgentPackageName: 'in.anishi.weather',
        ),
      ],
    );
  }
}