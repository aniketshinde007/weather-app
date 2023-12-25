import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/pages/home/provider.dart';
import 'package:weather/pages/loading/view.dart';

import '../../models/day_weather.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  String toSentenceCase(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<HomeData> dayWeather = ref.watch(homeDataProvider);

    return dayWeather.when(
      data: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar.large(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
            ),

            SliverToBoxAdapter(
              child: ListTile(
                title: Text(
                  'Today',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: const Text('Friday, 22 Dec 2023'),
                trailing: const Text('Nashik, MH, India'),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${_.dayWeather.main.temp.round()}°',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            CachedNetworkImage(
                              imageUrl: 'https://openweathermap.org/img/wn/${_.dayWeather.weather.first.icon}.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                        Text(
                          'High: ${_.dayWeather.main.tempMax.round()}° • Low: ${_.dayWeather.main.tempMin.round()}°',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          toSentenceCase(_.dayWeather.weather.first.description),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'Feels like ${_.dayWeather.main.feelsLike.round()}°',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.cloud_outlined),
                            Text(
                              ' ${_.dayWeather.clouds.all}%',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Text(' • '),
                            const Icon(Icons.air_outlined),
                            Text(
                              '${_.dayWeather.wind.speed.round()} km/h',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: ListTile(
                title: Text(
                  'Forecast',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: const Text('Upcoming 5 days forecast'),
              ),
            ),

            SliverList.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                var forecast = _.forecasts[index * 8];
                return ListTile(
                  leading: SizedBox(
                    height: 56,
                    width: 56,
                    child: CachedNetworkImage(
                      imageUrl: 'https://openweathermap.org/img/wn/${forecast.weather.first.icon}.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  title: Text(
                    '${DateFormat('EEEE').format(forecast.dateTime)} (${forecast.main.temp.round()}°)',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.cloud_outlined),
                      Text(
                        ' ${forecast.clouds.all}%',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text(' • '),
                      const Icon(Icons.air_outlined),
                      Text(
                        ' ${forecast.wind.speed} km/h',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  trailing: Text(
                    forecast.weather.first.main,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),

            const SliverToBoxAdapter(
              child: Gap(80),
            ),
          ],
        ),
      ),
      error: (e, s) => Center(
        child: Text(e.toString()),
      ),
      loading: () => const LoadingView(
        appbarIcon: Icon(Icons.home_outlined),
        appbarTitle: Text('Home'),
      ),
    );
  }
}