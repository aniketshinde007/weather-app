import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:weather/env/env.dart';

class MapsView extends ConsumerWidget {
  const MapsView({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            child: Text(
              'data',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(19.85, 74),
            initialZoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'in.anishi.weather',
            ),
            TileLayer(
              urlTemplate: 'https://tile.openweathermap.org/map/temp_new/{z}/{x}/{y}.png?appid=${Env.openWeatherKey}&area=worldview',
              userAgentPackageName: 'in.anishi.weather',
            ),
          ],
        ),
      ],
    );
  }
}